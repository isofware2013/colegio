package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class DiaSemanaHorarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [diaSemanaHorarioInstanceList: DiaSemanaHorario.list(params), diaSemanaHorarioInstanceTotal: DiaSemanaHorario.count()]
    }

    def create() {
        [diaSemanaHorarioInstance: new DiaSemanaHorario(params)]
    }

    def save() {
        def diaSemanaHorarioInstance = new DiaSemanaHorario(params)
        if (!diaSemanaHorarioInstance.save(flush: true)) {
            render(view: "create", model: [diaSemanaHorarioInstance: diaSemanaHorarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'diaSemanaHorario.label', default: 'DiaSemanaHorario'), diaSemanaHorarioInstance.id])
        redirect(action: "show", id: diaSemanaHorarioInstance.id)
    }

    def show(Long id) {
        def diaSemanaHorarioInstance = DiaSemanaHorario.get(id)
        if (!diaSemanaHorarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaSemanaHorario.label', default: 'DiaSemanaHorario'), id])
            redirect(action: "list")
            return
        }

        [diaSemanaHorarioInstance: diaSemanaHorarioInstance]
    }

    def edit(Long id) {
        def diaSemanaHorarioInstance = DiaSemanaHorario.get(id)
        if (!diaSemanaHorarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaSemanaHorario.label', default: 'DiaSemanaHorario'), id])
            redirect(action: "list")
            return
        }

        [diaSemanaHorarioInstance: diaSemanaHorarioInstance]
    }

    def update(Long id, Long version) {
        def diaSemanaHorarioInstance = DiaSemanaHorario.get(id)
        if (!diaSemanaHorarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaSemanaHorario.label', default: 'DiaSemanaHorario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (diaSemanaHorarioInstance.version > version) {
                diaSemanaHorarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'diaSemanaHorario.label', default: 'DiaSemanaHorario')] as Object[],
                          "Another user has updated this DiaSemanaHorario while you were editing")
                render(view: "edit", model: [diaSemanaHorarioInstance: diaSemanaHorarioInstance])
                return
            }
        }

        diaSemanaHorarioInstance.properties = params

        if (!diaSemanaHorarioInstance.save(flush: true)) {
            render(view: "edit", model: [diaSemanaHorarioInstance: diaSemanaHorarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'diaSemanaHorario.label', default: 'DiaSemanaHorario'), diaSemanaHorarioInstance.id])
        redirect(action: "show", id: diaSemanaHorarioInstance.id)
    }

    def delete(Long id) {
        def diaSemanaHorarioInstance = DiaSemanaHorario.get(id)
        if (!diaSemanaHorarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaSemanaHorario.label', default: 'DiaSemanaHorario'), id])
            redirect(action: "list")
            return
        }

        try {
            diaSemanaHorarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'diaSemanaHorario.label', default: 'DiaSemanaHorario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'diaSemanaHorario.label', default: 'DiaSemanaHorario'), id])
            redirect(action: "show", id: id)
        }
    }
}
