package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class RelativoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [relativoInstanceList: Relativo.list(params), relativoInstanceTotal: Relativo.count()]
    }

    def create() {
        [relativoInstance: new Relativo(params)]
    }

    def save() {
        def relativoInstance = new Relativo(params)
        if (!relativoInstance.save(flush: true)) {
            render(view: "create", model: [relativoInstance: relativoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'relativo.label', default: 'Relativo'), relativoInstance.id])
        redirect(action: "show", id: relativoInstance.id)
    }

    def show(Long id) {
        def relativoInstance = Relativo.get(id)
        if (!relativoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativo.label', default: 'Relativo'), id])
            redirect(action: "list")
            return
        }

        [relativoInstance: relativoInstance]
    }

    def edit(Long id) {
        def relativoInstance = Relativo.get(id)
        if (!relativoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativo.label', default: 'Relativo'), id])
            redirect(action: "list")
            return
        }

        [relativoInstance: relativoInstance]
    }

    def update(Long id, Long version) {
        def relativoInstance = Relativo.get(id)
        if (!relativoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativo.label', default: 'Relativo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (relativoInstance.version > version) {
                relativoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'relativo.label', default: 'Relativo')] as Object[],
                          "Another user has updated this Relativo while you were editing")
                render(view: "edit", model: [relativoInstance: relativoInstance])
                return
            }
        }

        relativoInstance.properties = params

        if (!relativoInstance.save(flush: true)) {
            render(view: "edit", model: [relativoInstance: relativoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'relativo.label', default: 'Relativo'), relativoInstance.id])
        redirect(action: "show", id: relativoInstance.id)
    }

    def delete(Long id) {
        def relativoInstance = Relativo.get(id)
        if (!relativoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativo.label', default: 'Relativo'), id])
            redirect(action: "list")
            return
        }

        try {
            relativoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'relativo.label', default: 'Relativo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'relativo.label', default: 'Relativo'), id])
            redirect(action: "show", id: id)
        }
    }
}
