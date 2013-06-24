package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class PremioAcademicoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [premioAcademicoInstanceList: PremioAcademico.list(params), premioAcademicoInstanceTotal: PremioAcademico.count()]
    }

    def create() {
        [premioAcademicoInstance: new PremioAcademico(params)]
    }

    def save() {
        def premioAcademicoInstance = new PremioAcademico(params)
        if (!premioAcademicoInstance.save(flush: true)) {
            render(view: "create", model: [premioAcademicoInstance: premioAcademicoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'premioAcademico.label', default: 'PremioAcademico'), premioAcademicoInstance.id])
        redirect(action: "show", id: premioAcademicoInstance.id)
    }

    def show(Long id) {
        def premioAcademicoInstance = PremioAcademico.get(id)
        if (!premioAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'premioAcademico.label', default: 'PremioAcademico'), id])
            redirect(action: "list")
            return
        }

        [premioAcademicoInstance: premioAcademicoInstance]
    }

    def edit(Long id) {
        def premioAcademicoInstance = PremioAcademico.get(id)
        if (!premioAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'premioAcademico.label', default: 'PremioAcademico'), id])
            redirect(action: "list")
            return
        }

        [premioAcademicoInstance: premioAcademicoInstance]
    }

    def update(Long id, Long version) {
        def premioAcademicoInstance = PremioAcademico.get(id)
        if (!premioAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'premioAcademico.label', default: 'PremioAcademico'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (premioAcademicoInstance.version > version) {
                premioAcademicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'premioAcademico.label', default: 'PremioAcademico')] as Object[],
                          "Another user has updated this PremioAcademico while you were editing")
                render(view: "edit", model: [premioAcademicoInstance: premioAcademicoInstance])
                return
            }
        }

        premioAcademicoInstance.properties = params

        if (!premioAcademicoInstance.save(flush: true)) {
            render(view: "edit", model: [premioAcademicoInstance: premioAcademicoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'premioAcademico.label', default: 'PremioAcademico'), premioAcademicoInstance.id])
        redirect(action: "show", id: premioAcademicoInstance.id)
    }

    def delete(Long id) {
        def premioAcademicoInstance = PremioAcademico.get(id)
        if (!premioAcademicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'premioAcademico.label', default: 'PremioAcademico'), id])
            redirect(action: "list")
            return
        }

        try {
            premioAcademicoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'premioAcademico.label', default: 'PremioAcademico'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'premioAcademico.label', default: 'PremioAcademico'), id])
            redirect(action: "show", id: id)
        }
    }
}
