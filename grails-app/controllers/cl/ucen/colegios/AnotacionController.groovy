package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class AnotacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [anotacionInstanceList: Anotacion.list(params), anotacionInstanceTotal: Anotacion.count()]
    }

    def create() {
        [anotacionInstance: new Anotacion(params)]
    }

    def save() {
        def anotacionInstance = new Anotacion(params)
        if (!anotacionInstance.save(flush: true)) {
            render(view: "create", model: [anotacionInstance: anotacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'anotacion.label', default: 'Anotacion'), anotacionInstance.id])
        redirect(action: "show", id: anotacionInstance.id)
    }

    def show(Long id) {
        def anotacionInstance = Anotacion.get(id)
        if (!anotacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'anotacion.label', default: 'Anotacion'), id])
            redirect(action: "list")
            return
        }

        [anotacionInstance: anotacionInstance]
    }

    def edit(Long id) {
        def anotacionInstance = Anotacion.get(id)
        if (!anotacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'anotacion.label', default: 'Anotacion'), id])
            redirect(action: "list")
            return
        }

        [anotacionInstance: anotacionInstance]
    }

    def update(Long id, Long version) {
        def anotacionInstance = Anotacion.get(id)
        if (!anotacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'anotacion.label', default: 'Anotacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (anotacionInstance.version > version) {
                anotacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'anotacion.label', default: 'Anotacion')] as Object[],
                          "Another user has updated this Anotacion while you were editing")
                render(view: "edit", model: [anotacionInstance: anotacionInstance])
                return
            }
        }

        anotacionInstance.properties = params

        if (!anotacionInstance.save(flush: true)) {
            render(view: "edit", model: [anotacionInstance: anotacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'anotacion.label', default: 'Anotacion'), anotacionInstance.id])
        redirect(action: "show", id: anotacionInstance.id)
    }

    def delete(Long id) {
        def anotacionInstance = Anotacion.get(id)
        if (!anotacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'anotacion.label', default: 'Anotacion'), id])
            redirect(action: "list")
            return
        }

        try {
            anotacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'anotacion.label', default: 'Anotacion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'anotacion.label', default: 'Anotacion'), id])
            redirect(action: "show", id: id)
        }
    }
}
