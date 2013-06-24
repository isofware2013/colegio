package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class GradoAcademicoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [gradoAcademicoInstanceList: GradoAcademico.list(params), gradoAcademicoInstanceTotal: GradoAcademico.count()]
    }

    def create() {
        [gradoAcademicoInstance: new GradoAcademico(params)]
    }

    def save() {
        def gradoAcademicoInstance = new GradoAcademico(params)
        if (!gradoAcademicoInstance.save(flush: true)) {
            render(view: "create", model: [gradoAcademicoInstance: gradoAcademicoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gradoAcademico.label', default: 'GradoAcademico'), gradoAcademicoInstance.id])
        redirect(action: "show", id: gradoAcademicoInstance.id)
    }

    def show(Long id) {
        def gradoAcademicoInstance = GradoAcademico.get(id)
        if (!gradoAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradoAcademico.label', default: 'GradoAcademico'), id])
            redirect(action: "list")
            return
        }

        [gradoAcademicoInstance: gradoAcademicoInstance]
    }

    def edit(Long id) {
        def gradoAcademicoInstance = GradoAcademico.get(id)
        if (!gradoAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradoAcademico.label', default: 'GradoAcademico'), id])
            redirect(action: "list")
            return
        }

        [gradoAcademicoInstance: gradoAcademicoInstance]
    }

    def update(Long id, Long version) {
        def gradoAcademicoInstance = GradoAcademico.get(id)
        if (!gradoAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradoAcademico.label', default: 'GradoAcademico'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gradoAcademicoInstance.version > version) {
                gradoAcademicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gradoAcademico.label', default: 'GradoAcademico')] as Object[],
                          "Another user has updated this GradoAcademico while you were editing")
                render(view: "edit", model: [gradoAcademicoInstance: gradoAcademicoInstance])
                return
            }
        }

        gradoAcademicoInstance.properties = params

        if (!gradoAcademicoInstance.save(flush: true)) {
            render(view: "edit", model: [gradoAcademicoInstance: gradoAcademicoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gradoAcademico.label', default: 'GradoAcademico'), gradoAcademicoInstance.id])
        redirect(action: "show", id: gradoAcademicoInstance.id)
    }

    def delete(Long id) {
        def gradoAcademicoInstance = GradoAcademico.get(id)
        if (!gradoAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradoAcademico.label', default: 'GradoAcademico'), id])
            redirect(action: "list")
            return
        }

        try {
            gradoAcademicoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gradoAcademico.label', default: 'GradoAcademico'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gradoAcademico.label', default: 'GradoAcademico'), id])
            redirect(action: "show", id: id)
        }
    }
}
