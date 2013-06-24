package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class ObservacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [observacionInstanceList: Observacion.list(params), observacionInstanceTotal: Observacion.count()]
    }

    def create() {
        [observacionInstance: new Observacion(params)]
    }

    def save() {
        def observacionInstance = new Observacion(params)
        if (!observacionInstance.save(flush: true)) {
            render(view: "create", model: [observacionInstance: observacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'observacion.label', default: 'Observacion'), observacionInstance.id])
        redirect(action: "show", id: observacionInstance.id)
    }

    def show(Long id) {
        def observacionInstance = Observacion.get(id)
        if (!observacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
            redirect(action: "list")
            return
        }

        [observacionInstance: observacionInstance]
    }

    def edit(Long id) {
        def observacionInstance = Observacion.get(id)
        if (!observacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
            redirect(action: "list")
            return
        }

        [observacionInstance: observacionInstance]
    }

    def update(Long id, Long version) {
        def observacionInstance = Observacion.get(id)
        if (!observacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (observacionInstance.version > version) {
                observacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'observacion.label', default: 'Observacion')] as Object[],
                          "Another user has updated this Observacion while you were editing")
                render(view: "edit", model: [observacionInstance: observacionInstance])
                return
            }
        }

        observacionInstance.properties = params

        if (!observacionInstance.save(flush: true)) {
            render(view: "edit", model: [observacionInstance: observacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'observacion.label', default: 'Observacion'), observacionInstance.id])
        redirect(action: "show", id: observacionInstance.id)
    }

    def delete(Long id) {
        def observacionInstance = Observacion.get(id)
        if (!observacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
            redirect(action: "list")
            return
        }

        try {
            observacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'observacion.label', default: 'Observacion'), id])
            redirect(action: "show", id: id)
        }
    }
}
