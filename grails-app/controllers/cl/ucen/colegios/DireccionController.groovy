package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class DireccionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [direccionInstanceList: Direccion.list(params), direccionInstanceTotal: Direccion.count()]
    }

    def create() {
        [direccionInstance: new Direccion(params)]
    }

    def save() {
        def direccionInstance = new Direccion(params)
        if (!direccionInstance.save(flush: true)) {
            render(view: "create", model: [direccionInstance: direccionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'direccion.label', default: 'Direccion'), direccionInstance.id])
        redirect(action: "show", id: direccionInstance.id)
    }

    def show(Long id) {
        def direccionInstance = Direccion.get(id)
        if (!direccionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccion.label', default: 'Direccion'), id])
            redirect(action: "list")
            return
        }

        [direccionInstance: direccionInstance]
    }

    def edit(Long id) {
        def direccionInstance = Direccion.get(id)
        if (!direccionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccion.label', default: 'Direccion'), id])
            redirect(action: "list")
            return
        }

        [direccionInstance: direccionInstance]
    }

    def update(Long id, Long version) {
        def direccionInstance = Direccion.get(id)
        if (!direccionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccion.label', default: 'Direccion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (direccionInstance.version > version) {
                direccionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'direccion.label', default: 'Direccion')] as Object[],
                          "Another user has updated this Direccion while you were editing")
                render(view: "edit", model: [direccionInstance: direccionInstance])
                return
            }
        }

        direccionInstance.properties = params

        if (!direccionInstance.save(flush: true)) {
            render(view: "edit", model: [direccionInstance: direccionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'direccion.label', default: 'Direccion'), direccionInstance.id])
        redirect(action: "show", id: direccionInstance.id)
    }

    def delete(Long id) {
        def direccionInstance = Direccion.get(id)
        if (!direccionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'direccion.label', default: 'Direccion'), id])
            redirect(action: "list")
            return
        }

        try {
            direccionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'direccion.label', default: 'Direccion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'direccion.label', default: 'Direccion'), id])
            redirect(action: "show", id: id)
        }
    }
}
