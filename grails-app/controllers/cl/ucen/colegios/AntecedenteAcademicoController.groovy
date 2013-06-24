package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class AntecedenteAcademicoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [antecedenteAcademicoInstanceList: AntecedenteAcademico.list(params), antecedenteAcademicoInstanceTotal: AntecedenteAcademico.count()]
    }

    def create() {
        [antecedenteAcademicoInstance: new AntecedenteAcademico(params)]
    }

    def save() {
        def antecedenteAcademicoInstance = new AntecedenteAcademico(params)
        if (!antecedenteAcademicoInstance.save(flush: true)) {
            render(view: "create", model: [antecedenteAcademicoInstance: antecedenteAcademicoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'antecedenteAcademico.label', default: 'AntecedenteAcademico'), antecedenteAcademicoInstance.id])
        redirect(action: "show", id: antecedenteAcademicoInstance.id)
    }

    def show(Long id) {
        def antecedenteAcademicoInstance = AntecedenteAcademico.get(id)
        if (!antecedenteAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'antecedenteAcademico.label', default: 'AntecedenteAcademico'), id])
            redirect(action: "list")
            return
        }

        [antecedenteAcademicoInstance: antecedenteAcademicoInstance]
    }

    def edit(Long id) {
        def antecedenteAcademicoInstance = AntecedenteAcademico.get(id)
        if (!antecedenteAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'antecedenteAcademico.label', default: 'AntecedenteAcademico'), id])
            redirect(action: "list")
            return
        }

        [antecedenteAcademicoInstance: antecedenteAcademicoInstance]
    }

    def update(Long id, Long version) {
        def antecedenteAcademicoInstance = AntecedenteAcademico.get(id)
        if (!antecedenteAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'antecedenteAcademico.label', default: 'AntecedenteAcademico'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (antecedenteAcademicoInstance.version > version) {
                antecedenteAcademicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'antecedenteAcademico.label', default: 'AntecedenteAcademico')] as Object[],
                          "Another user has updated this AntecedenteAcademico while you were editing")
                render(view: "edit", model: [antecedenteAcademicoInstance: antecedenteAcademicoInstance])
                return
            }
        }

        antecedenteAcademicoInstance.properties = params

        if (!antecedenteAcademicoInstance.save(flush: true)) {
            render(view: "edit", model: [antecedenteAcademicoInstance: antecedenteAcademicoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'antecedenteAcademico.label', default: 'AntecedenteAcademico'), antecedenteAcademicoInstance.id])
        redirect(action: "show", id: antecedenteAcademicoInstance.id)
    }

    def delete(Long id) {
        def antecedenteAcademicoInstance = AntecedenteAcademico.get(id)
        if (!antecedenteAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'antecedenteAcademico.label', default: 'AntecedenteAcademico'), id])
            redirect(action: "list")
            return
        }

        try {
            antecedenteAcademicoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'antecedenteAcademico.label', default: 'AntecedenteAcademico'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'antecedenteAcademico.label', default: 'AntecedenteAcademico'), id])
            redirect(action: "show", id: id)
        }
    }
}
