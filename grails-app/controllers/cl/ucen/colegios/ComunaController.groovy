package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class ComunaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [comunaInstanceList: Comuna.list(params), comunaInstanceTotal: Comuna.count()]
    }

    def create() {
        [comunaInstance: new Comuna(params)]
    }

    def save() {
        def comunaInstance = new Comuna(params)
        if (!comunaInstance.save(flush: true)) {
            render(view: "create", model: [comunaInstance: comunaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'comuna.label', default: 'Comuna'), comunaInstance.id])
        redirect(action: "show", id: comunaInstance.id)
    }

    def show(Long id) {
        def comunaInstance = Comuna.get(id)
        if (!comunaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comuna.label', default: 'Comuna'), id])
            redirect(action: "list")
            return
        }

        [comunaInstance: comunaInstance]
    }

    def edit(Long id) {
        def comunaInstance = Comuna.get(id)
        if (!comunaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comuna.label', default: 'Comuna'), id])
            redirect(action: "list")
            return
        }

        [comunaInstance: comunaInstance]
    }

    def update(Long id, Long version) {
        def comunaInstance = Comuna.get(id)
        if (!comunaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comuna.label', default: 'Comuna'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (comunaInstance.version > version) {
                comunaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'comuna.label', default: 'Comuna')] as Object[],
                          "Another user has updated this Comuna while you were editing")
                render(view: "edit", model: [comunaInstance: comunaInstance])
                return
            }
        }

        comunaInstance.properties = params

        if (!comunaInstance.save(flush: true)) {
            render(view: "edit", model: [comunaInstance: comunaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'comuna.label', default: 'Comuna'), comunaInstance.id])
        redirect(action: "show", id: comunaInstance.id)
    }

    def delete(Long id) {
        def comunaInstance = Comuna.get(id)
        if (!comunaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comuna.label', default: 'Comuna'), id])
            redirect(action: "list")
            return
        }

        try {
            comunaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'comuna.label', default: 'Comuna'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'comuna.label', default: 'Comuna'), id])
            redirect(action: "show", id: id)
        }
    }
}
