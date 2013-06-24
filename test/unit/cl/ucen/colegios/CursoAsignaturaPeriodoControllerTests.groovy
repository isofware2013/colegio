package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(CursoAsignaturaPeriodoController)
@Mock(CursoAsignaturaPeriodo)
class CursoAsignaturaPeriodoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cursoAsignaturaPeriodo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cursoAsignaturaPeriodoInstanceList.size() == 0
        assert model.cursoAsignaturaPeriodoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cursoAsignaturaPeriodoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cursoAsignaturaPeriodoInstance != null
        assert view == '/cursoAsignaturaPeriodo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cursoAsignaturaPeriodo/show/1'
        assert controller.flash.message != null
        assert CursoAsignaturaPeriodo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cursoAsignaturaPeriodo/list'

        populateValidParams(params)
        def cursoAsignaturaPeriodo = new CursoAsignaturaPeriodo(params)

        assert cursoAsignaturaPeriodo.save() != null

        params.id = cursoAsignaturaPeriodo.id

        def model = controller.show()

        assert model.cursoAsignaturaPeriodoInstance == cursoAsignaturaPeriodo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cursoAsignaturaPeriodo/list'

        populateValidParams(params)
        def cursoAsignaturaPeriodo = new CursoAsignaturaPeriodo(params)

        assert cursoAsignaturaPeriodo.save() != null

        params.id = cursoAsignaturaPeriodo.id

        def model = controller.edit()

        assert model.cursoAsignaturaPeriodoInstance == cursoAsignaturaPeriodo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cursoAsignaturaPeriodo/list'

        response.reset()

        populateValidParams(params)
        def cursoAsignaturaPeriodo = new CursoAsignaturaPeriodo(params)

        assert cursoAsignaturaPeriodo.save() != null

        // test invalid parameters in update
        params.id = cursoAsignaturaPeriodo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cursoAsignaturaPeriodo/edit"
        assert model.cursoAsignaturaPeriodoInstance != null

        cursoAsignaturaPeriodo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cursoAsignaturaPeriodo/show/$cursoAsignaturaPeriodo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cursoAsignaturaPeriodo.clearErrors()

        populateValidParams(params)
        params.id = cursoAsignaturaPeriodo.id
        params.version = -1
        controller.update()

        assert view == "/cursoAsignaturaPeriodo/edit"
        assert model.cursoAsignaturaPeriodoInstance != null
        assert model.cursoAsignaturaPeriodoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cursoAsignaturaPeriodo/list'

        response.reset()

        populateValidParams(params)
        def cursoAsignaturaPeriodo = new CursoAsignaturaPeriodo(params)

        assert cursoAsignaturaPeriodo.save() != null
        assert CursoAsignaturaPeriodo.count() == 1

        params.id = cursoAsignaturaPeriodo.id

        controller.delete()

        assert CursoAsignaturaPeriodo.count() == 0
        assert CursoAsignaturaPeriodo.get(cursoAsignaturaPeriodo.id) == null
        assert response.redirectedUrl == '/cursoAsignaturaPeriodo/list'
    }
}
