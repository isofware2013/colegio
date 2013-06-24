package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class RelativoAlumnoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [relativoAlumnoInstanceList: RelativoAlumno.list(params), relativoAlumnoInstanceTotal: RelativoAlumno.count()]
    }

    def create() {
        [relativoAlumnoInstance: new RelativoAlumno(params)]
    }

    def save() {
        def relativoAlumnoInstance = new RelativoAlumno(params)
        if (!relativoAlumnoInstance.save(flush: true)) {
            render(view: "create", model: [relativoAlumnoInstance: relativoAlumnoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'relativoAlumno.label', default: 'RelativoAlumno'), relativoAlumnoInstance.id])
        redirect(action: "show", id: relativoAlumnoInstance.id)
    }

    def show(Long id) {
        def relativoAlumnoInstance = RelativoAlumno.get(id)
        if (!relativoAlumnoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativoAlumno.label', default: 'RelativoAlumno'), id])
            redirect(action: "list")
            return
        }

        [relativoAlumnoInstance: relativoAlumnoInstance]
    }

    def edit(Long id) {
        def relativoAlumnoInstance = RelativoAlumno.get(id)
        if (!relativoAlumnoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativoAlumno.label', default: 'RelativoAlumno'), id])
            redirect(action: "list")
            return
        }

        [relativoAlumnoInstance: relativoAlumnoInstance]
    }

    def update(Long id, Long version) {
        def relativoAlumnoInstance = RelativoAlumno.get(id)
        if (!relativoAlumnoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativoAlumno.label', default: 'RelativoAlumno'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (relativoAlumnoInstance.version > version) {
                relativoAlumnoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'relativoAlumno.label', default: 'RelativoAlumno')] as Object[],
                          "Another user has updated this RelativoAlumno while you were editing")
                render(view: "edit", model: [relativoAlumnoInstance: relativoAlumnoInstance])
                return
            }
        }

        relativoAlumnoInstance.properties = params

        if (!relativoAlumnoInstance.save(flush: true)) {
            render(view: "edit", model: [relativoAlumnoInstance: relativoAlumnoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'relativoAlumno.label', default: 'RelativoAlumno'), relativoAlumnoInstance.id])
        redirect(action: "show", id: relativoAlumnoInstance.id)
    }

    def delete(Long id) {
        def relativoAlumnoInstance = RelativoAlumno.get(id)
        if (!relativoAlumnoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relativoAlumno.label', default: 'RelativoAlumno'), id])
            redirect(action: "list")
            return
        }

        try {
            relativoAlumnoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'relativoAlumno.label', default: 'RelativoAlumno'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'relativoAlumno.label', default: 'RelativoAlumno'), id])
            redirect(action: "show", id: id)
        }
    }
}
