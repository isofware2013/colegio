package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class DiaCursoAsignaturaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [diaCursoAsignaturaInstanceList: DiaCursoAsignatura.list(params), diaCursoAsignaturaInstanceTotal: DiaCursoAsignatura.count()]
    }

    def create() {
        [diaCursoAsignaturaInstance: new DiaCursoAsignatura(params)]
    }

    def save() {
        def diaCursoAsignaturaInstance = new DiaCursoAsignatura(params)
        if (!diaCursoAsignaturaInstance.save(flush: true)) {
            render(view: "create", model: [diaCursoAsignaturaInstance: diaCursoAsignaturaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura'), diaCursoAsignaturaInstance.id])
        redirect(action: "show", id: diaCursoAsignaturaInstance.id)
    }

    def show(Long id) {
        def diaCursoAsignaturaInstance = DiaCursoAsignatura.get(id)
        if (!diaCursoAsignaturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura'), id])
            redirect(action: "list")
            return
        }

        [diaCursoAsignaturaInstance: diaCursoAsignaturaInstance]
    }

    def edit(Long id) {
        def diaCursoAsignaturaInstance = DiaCursoAsignatura.get(id)
        if (!diaCursoAsignaturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura'), id])
            redirect(action: "list")
            return
        }

        [diaCursoAsignaturaInstance: diaCursoAsignaturaInstance]
    }

    def update(Long id, Long version) {
        def diaCursoAsignaturaInstance = DiaCursoAsignatura.get(id)
        if (!diaCursoAsignaturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (diaCursoAsignaturaInstance.version > version) {
                diaCursoAsignaturaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura')] as Object[],
                          "Another user has updated this DiaCursoAsignatura while you were editing")
                render(view: "edit", model: [diaCursoAsignaturaInstance: diaCursoAsignaturaInstance])
                return
            }
        }

        diaCursoAsignaturaInstance.properties = params

        if (!diaCursoAsignaturaInstance.save(flush: true)) {
            render(view: "edit", model: [diaCursoAsignaturaInstance: diaCursoAsignaturaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura'), diaCursoAsignaturaInstance.id])
        redirect(action: "show", id: diaCursoAsignaturaInstance.id)
    }

    def delete(Long id) {
        def diaCursoAsignaturaInstance = DiaCursoAsignatura.get(id)
        if (!diaCursoAsignaturaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura'), id])
            redirect(action: "list")
            return
        }

        try {
            diaCursoAsignaturaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'diaCursoAsignatura.label', default: 'DiaCursoAsignatura'), id])
            redirect(action: "show", id: id)
        }
    }
}
