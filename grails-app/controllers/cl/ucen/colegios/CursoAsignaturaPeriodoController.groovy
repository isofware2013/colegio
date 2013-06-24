package cl.ucen.colegios

import org.springframework.dao.DataIntegrityViolationException

class CursoAsignaturaPeriodoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cursoAsignaturaPeriodoInstanceList: CursoAsignaturaPeriodo.list(params), cursoAsignaturaPeriodoInstanceTotal: CursoAsignaturaPeriodo.count()]
    }

    def create() {
        [cursoAsignaturaPeriodoInstance: new CursoAsignaturaPeriodo(params)]
    }

    def save() {
        def cursoAsignaturaPeriodoInstance = new CursoAsignaturaPeriodo(params)
        if (!cursoAsignaturaPeriodoInstance.save(flush: true)) {
            render(view: "create", model: [cursoAsignaturaPeriodoInstance: cursoAsignaturaPeriodoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo'), cursoAsignaturaPeriodoInstance.id])
        redirect(action: "show", id: cursoAsignaturaPeriodoInstance.id)
    }

    def show(Long id) {
        def cursoAsignaturaPeriodoInstance = CursoAsignaturaPeriodo.get(id)
        if (!cursoAsignaturaPeriodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo'), id])
            redirect(action: "list")
            return
        }

        [cursoAsignaturaPeriodoInstance: cursoAsignaturaPeriodoInstance]
    }

    def edit(Long id) {
        def cursoAsignaturaPeriodoInstance = CursoAsignaturaPeriodo.get(id)
        if (!cursoAsignaturaPeriodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo'), id])
            redirect(action: "list")
            return
        }

        [cursoAsignaturaPeriodoInstance: cursoAsignaturaPeriodoInstance]
    }

    def update(Long id, Long version) {
        def cursoAsignaturaPeriodoInstance = CursoAsignaturaPeriodo.get(id)
        if (!cursoAsignaturaPeriodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cursoAsignaturaPeriodoInstance.version > version) {
                cursoAsignaturaPeriodoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo')] as Object[],
                          "Another user has updated this CursoAsignaturaPeriodo while you were editing")
                render(view: "edit", model: [cursoAsignaturaPeriodoInstance: cursoAsignaturaPeriodoInstance])
                return
            }
        }

        cursoAsignaturaPeriodoInstance.properties = params

        if (!cursoAsignaturaPeriodoInstance.save(flush: true)) {
            render(view: "edit", model: [cursoAsignaturaPeriodoInstance: cursoAsignaturaPeriodoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo'), cursoAsignaturaPeriodoInstance.id])
        redirect(action: "show", id: cursoAsignaturaPeriodoInstance.id)
    }

    def delete(Long id) {
        def cursoAsignaturaPeriodoInstance = CursoAsignaturaPeriodo.get(id)
        if (!cursoAsignaturaPeriodoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo'), id])
            redirect(action: "list")
            return
        }

        try {
            cursoAsignaturaPeriodoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cursoAsignaturaPeriodo.label', default: 'CursoAsignaturaPeriodo'), id])
            redirect(action: "show", id: id)
        }
    }
}
