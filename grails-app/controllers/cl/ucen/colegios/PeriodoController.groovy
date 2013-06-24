package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class PeriodoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [periodoInstanceList: Periodo.list(params), periodoInstanceTotal: Periodo.count()]
    }

    def create() {
        [periodoInstance: new Periodo(params)]
    }

    def save() {
        def periodoInstance = new Periodo(params)
        if (!periodoInstance.save(flush: true)) {
            render(view: "create", model: [periodoInstance: periodoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'periodo.label', default: 'Periodo'), periodoInstance.id])
        redirect(action: "show", id: periodoInstance.id)
    }

    def show(Long id) {
        def periodoInstance = Periodo.get(id)
        if (!periodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodo.label', default: 'Periodo'), id])
            redirect(action: "list")
            return
        }

        [periodoInstance: periodoInstance]
    }

    def edit(Long id) {
        def periodoInstance = Periodo.get(id)
        if (!periodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodo.label', default: 'Periodo'), id])
            redirect(action: "list")
            return
        }

        [periodoInstance: periodoInstance]
    }

    def update(Long id, Long version) {
        def periodoInstance = Periodo.get(id)
        if (!periodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodo.label', default: 'Periodo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (periodoInstance.version > version) {
                periodoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'periodo.label', default: 'Periodo')] as Object[],
                          "Another user has updated this Periodo while you were editing")
                render(view: "edit", model: [periodoInstance: periodoInstance])
                return
            }
        }

        periodoInstance.properties = params

        if (!periodoInstance.save(flush: true)) {
            render(view: "edit", model: [periodoInstance: periodoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'periodo.label', default: 'Periodo'), periodoInstance.id])
        redirect(action: "show", id: periodoInstance.id)
    }

    def delete(Long id) {
        def periodoInstance = Periodo.get(id)
        if (!periodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodo.label', default: 'Periodo'), id])
            redirect(action: "list")
            return
        }

        try {
            periodoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'periodo.label', default: 'Periodo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'periodo.label', default: 'Periodo'), id])
            redirect(action: "show", id: id)
        }
    }
}
