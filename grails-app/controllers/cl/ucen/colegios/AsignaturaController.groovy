package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class AsignaturaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [asignaturaInstanceList: Asignatura.list(params), asignaturaInstanceTotal: Asignatura.count()]
    }

    def create() {
        [asignaturaInstance: new Asignatura(params)]
    }

    def save() {
        def asignaturaInstance = new Asignatura(params)
        if (!asignaturaInstance.save(flush: true)) {
            render(view: "create", model: [asignaturaInstance: asignaturaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'asignatura.label', default: 'Asignatura'), asignaturaInstance.id])
        redirect(action: "show", id: asignaturaInstance.id)
    }

    def show(Long id) {
        def asignaturaInstance = Asignatura.get(id)
        if (!asignaturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignatura.label', default: 'Asignatura'), id])
            redirect(action: "list")
            return
        }

        [asignaturaInstance: asignaturaInstance]
    }

    def edit(Long id) {
        def asignaturaInstance = Asignatura.get(id)
        if (!asignaturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignatura.label', default: 'Asignatura'), id])
            redirect(action: "list")
            return
        }

        [asignaturaInstance: asignaturaInstance]
    }

    def update(Long id, Long version) {
        def asignaturaInstance = Asignatura.get(id)
        if (!asignaturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignatura.label', default: 'Asignatura'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (asignaturaInstance.version > version) {
                asignaturaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'asignatura.label', default: 'Asignatura')] as Object[],
                          "Another user has updated this Asignatura while you were editing")
                render(view: "edit", model: [asignaturaInstance: asignaturaInstance])
                return
            }
        }

        asignaturaInstance.properties = params

        if (!asignaturaInstance.save(flush: true)) {
            render(view: "edit", model: [asignaturaInstance: asignaturaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'asignatura.label', default: 'Asignatura'), asignaturaInstance.id])
        redirect(action: "show", id: asignaturaInstance.id)
    }

    def delete(Long id) {
        def asignaturaInstance = Asignatura.get(id)
        if (!asignaturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignatura.label', default: 'Asignatura'), id])
            redirect(action: "list")
            return
        }

        try {
            asignaturaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'asignatura.label', default: 'Asignatura'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'asignatura.label', default: 'Asignatura'), id])
            redirect(action: "show", id: id)
        }
    }
}
