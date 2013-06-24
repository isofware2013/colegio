package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class PeriodoEscolarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [periodoEscolarInstanceList: PeriodoEscolar.list(params), periodoEscolarInstanceTotal: PeriodoEscolar.count()]
    }

    def create() {
        [periodoEscolarInstance: new PeriodoEscolar(params)]
    }

    def save() {
        def periodoEscolarInstance = new PeriodoEscolar(params)
        if (!periodoEscolarInstance.save(flush: true)) {
            render(view: "create", model: [periodoEscolarInstance: periodoEscolarInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'periodoEscolar.label', default: 'PeriodoEscolar'), periodoEscolarInstance.id])
        redirect(action: "show", id: periodoEscolarInstance.id)
    }

    def show(Long id) {
        def periodoEscolarInstance = PeriodoEscolar.get(id)
        if (!periodoEscolarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoEscolar.label', default: 'PeriodoEscolar'), id])
            redirect(action: "list")
            return
        }

        [periodoEscolarInstance: periodoEscolarInstance]
    }

    def edit(Long id) {
        def periodoEscolarInstance = PeriodoEscolar.get(id)
        if (!periodoEscolarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoEscolar.label', default: 'PeriodoEscolar'), id])
            redirect(action: "list")
            return
        }

        [periodoEscolarInstance: periodoEscolarInstance]
    }

    def update(Long id, Long version) {
        def periodoEscolarInstance = PeriodoEscolar.get(id)
        if (!periodoEscolarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoEscolar.label', default: 'PeriodoEscolar'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (periodoEscolarInstance.version > version) {
                periodoEscolarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'periodoEscolar.label', default: 'PeriodoEscolar')] as Object[],
                          "Another user has updated this PeriodoEscolar while you were editing")
                render(view: "edit", model: [periodoEscolarInstance: periodoEscolarInstance])
                return
            }
        }

        periodoEscolarInstance.properties = params

        if (!periodoEscolarInstance.save(flush: true)) {
            render(view: "edit", model: [periodoEscolarInstance: periodoEscolarInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'periodoEscolar.label', default: 'PeriodoEscolar'), periodoEscolarInstance.id])
        redirect(action: "show", id: periodoEscolarInstance.id)
    }

    def delete(Long id) {
        def periodoEscolarInstance = PeriodoEscolar.get(id)
        if (!periodoEscolarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoEscolar.label', default: 'PeriodoEscolar'), id])
            redirect(action: "list")
            return
        }

        try {
            periodoEscolarInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'periodoEscolar.label', default: 'PeriodoEscolar'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'periodoEscolar.label', default: 'PeriodoEscolar'), id])
            redirect(action: "show", id: id)
        }
    }
}
