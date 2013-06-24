package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class EvaluacionDefinidaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [evaluacionDefinidaInstanceList: EvaluacionDefinida.list(params), evaluacionDefinidaInstanceTotal: EvaluacionDefinida.count()]
    }

    def create() {
        [evaluacionDefinidaInstance: new EvaluacionDefinida(params)]
    }

    def save() {
        def evaluacionDefinidaInstance = new EvaluacionDefinida(params)
        if (!evaluacionDefinidaInstance.save(flush: true)) {
            render(view: "create", model: [evaluacionDefinidaInstance: evaluacionDefinidaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'evaluacionDefinida.label', default: 'EvaluacionDefinida'), evaluacionDefinidaInstance.id])
        redirect(action: "show", id: evaluacionDefinidaInstance.id)
    }

    def show(Long id) {
        def evaluacionDefinidaInstance = EvaluacionDefinida.get(id)
        if (!evaluacionDefinidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evaluacionDefinida.label', default: 'EvaluacionDefinida'), id])
            redirect(action: "list")
            return
        }

        [evaluacionDefinidaInstance: evaluacionDefinidaInstance]
    }

    def edit(Long id) {
        def evaluacionDefinidaInstance = EvaluacionDefinida.get(id)
        if (!evaluacionDefinidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evaluacionDefinida.label', default: 'EvaluacionDefinida'), id])
            redirect(action: "list")
            return
        }

        [evaluacionDefinidaInstance: evaluacionDefinidaInstance]
    }

    def update(Long id, Long version) {
        def evaluacionDefinidaInstance = EvaluacionDefinida.get(id)
        if (!evaluacionDefinidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evaluacionDefinida.label', default: 'EvaluacionDefinida'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (evaluacionDefinidaInstance.version > version) {
                evaluacionDefinidaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'evaluacionDefinida.label', default: 'EvaluacionDefinida')] as Object[],
                          "Another user has updated this EvaluacionDefinida while you were editing")
                render(view: "edit", model: [evaluacionDefinidaInstance: evaluacionDefinidaInstance])
                return
            }
        }

        evaluacionDefinidaInstance.properties = params

        if (!evaluacionDefinidaInstance.save(flush: true)) {
            render(view: "edit", model: [evaluacionDefinidaInstance: evaluacionDefinidaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'evaluacionDefinida.label', default: 'EvaluacionDefinida'), evaluacionDefinidaInstance.id])
        redirect(action: "show", id: evaluacionDefinidaInstance.id)
    }

    def delete(Long id) {
        def evaluacionDefinidaInstance = EvaluacionDefinida.get(id)
        if (!evaluacionDefinidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evaluacionDefinida.label', default: 'EvaluacionDefinida'), id])
            redirect(action: "list")
            return
        }

        try {
            evaluacionDefinidaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'evaluacionDefinida.label', default: 'EvaluacionDefinida'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'evaluacionDefinida.label', default: 'EvaluacionDefinida'), id])
            redirect(action: "show", id: id)
        }
    }
}
