package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class CalificacionEvaluacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [calificacionEvaluacionInstanceList: CalificacionEvaluacion.list(params), calificacionEvaluacionInstanceTotal: CalificacionEvaluacion.count()]
    }

    def create() {
        [calificacionEvaluacionInstance: new CalificacionEvaluacion(params)]
    }

    def save() {
        def calificacionEvaluacionInstance = new CalificacionEvaluacion(params)
        if (!calificacionEvaluacionInstance.save(flush: true)) {
            render(view: "create", model: [calificacionEvaluacionInstance: calificacionEvaluacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion'), calificacionEvaluacionInstance.id])
        redirect(action: "show", id: calificacionEvaluacionInstance.id)
    }

    def show(Long id) {
        def calificacionEvaluacionInstance = CalificacionEvaluacion.get(id)
        if (!calificacionEvaluacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion'), id])
            redirect(action: "list")
            return
        }

        [calificacionEvaluacionInstance: calificacionEvaluacionInstance]
    }

    def edit(Long id) {
        def calificacionEvaluacionInstance = CalificacionEvaluacion.get(id)
        if (!calificacionEvaluacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion'), id])
            redirect(action: "list")
            return
        }

        [calificacionEvaluacionInstance: calificacionEvaluacionInstance]
    }

    def update(Long id, Long version) {
        def calificacionEvaluacionInstance = CalificacionEvaluacion.get(id)
        if (!calificacionEvaluacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (calificacionEvaluacionInstance.version > version) {
                calificacionEvaluacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion')] as Object[],
                          "Another user has updated this CalificacionEvaluacion while you were editing")
                render(view: "edit", model: [calificacionEvaluacionInstance: calificacionEvaluacionInstance])
                return
            }
        }

        calificacionEvaluacionInstance.properties = params

        if (!calificacionEvaluacionInstance.save(flush: true)) {
            render(view: "edit", model: [calificacionEvaluacionInstance: calificacionEvaluacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion'), calificacionEvaluacionInstance.id])
        redirect(action: "show", id: calificacionEvaluacionInstance.id)
    }

    def delete(Long id) {
        def calificacionEvaluacionInstance = CalificacionEvaluacion.get(id)
        if (!calificacionEvaluacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion'), id])
            redirect(action: "list")
            return
        }

        try {
            calificacionEvaluacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'calificacionEvaluacion.label', default: 'CalificacionEvaluacion'), id])
            redirect(action: "show", id: id)
        }
    }
}
