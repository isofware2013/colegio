package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class TipoAnotacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoAnotacionInstanceList: TipoAnotacion.list(params), tipoAnotacionInstanceTotal: TipoAnotacion.count()]
    }

    def create() {
        [tipoAnotacionInstance: new TipoAnotacion(params)]
    }

    def save() {
        def tipoAnotacionInstance = new TipoAnotacion(params)
        if (!tipoAnotacionInstance.save(flush: true)) {
            render(view: "create", model: [tipoAnotacionInstance: tipoAnotacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoAnotacion.label', default: 'TipoAnotacion'), tipoAnotacionInstance.id])
        redirect(action: "show", id: tipoAnotacionInstance.id)
    }

    def show(Long id) {
        def tipoAnotacionInstance = TipoAnotacion.get(id)
        if (!tipoAnotacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAnotacion.label', default: 'TipoAnotacion'), id])
            redirect(action: "list")
            return
        }

        [tipoAnotacionInstance: tipoAnotacionInstance]
    }

    def edit(Long id) {
        def tipoAnotacionInstance = TipoAnotacion.get(id)
        if (!tipoAnotacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAnotacion.label', default: 'TipoAnotacion'), id])
            redirect(action: "list")
            return
        }

        [tipoAnotacionInstance: tipoAnotacionInstance]
    }

    def update(Long id, Long version) {
        def tipoAnotacionInstance = TipoAnotacion.get(id)
        if (!tipoAnotacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAnotacion.label', default: 'TipoAnotacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoAnotacionInstance.version > version) {
                tipoAnotacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoAnotacion.label', default: 'TipoAnotacion')] as Object[],
                          "Another user has updated this TipoAnotacion while you were editing")
                render(view: "edit", model: [tipoAnotacionInstance: tipoAnotacionInstance])
                return
            }
        }

        tipoAnotacionInstance.properties = params

        if (!tipoAnotacionInstance.save(flush: true)) {
            render(view: "edit", model: [tipoAnotacionInstance: tipoAnotacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoAnotacion.label', default: 'TipoAnotacion'), tipoAnotacionInstance.id])
        redirect(action: "show", id: tipoAnotacionInstance.id)
    }

    def delete(Long id) {
        def tipoAnotacionInstance = TipoAnotacion.get(id)
        if (!tipoAnotacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAnotacion.label', default: 'TipoAnotacion'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoAnotacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoAnotacion.label', default: 'TipoAnotacion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoAnotacion.label', default: 'TipoAnotacion'), id])
            redirect(action: "show", id: id)
        }
    }
}
