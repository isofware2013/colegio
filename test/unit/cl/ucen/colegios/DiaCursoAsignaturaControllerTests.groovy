package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(DiaCursoAsignaturaController)
@Mock(DiaCursoAsignatura)
class DiaCursoAsignaturaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/diaCursoAsignatura/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.diaCursoAsignaturaInstanceList.size() == 0
        assert model.diaCursoAsignaturaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.diaCursoAsignaturaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.diaCursoAsignaturaInstance != null
        assert view == '/diaCursoAsignatura/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/diaCursoAsignatura/show/1'
        assert controller.flash.message != null
        assert DiaCursoAsignatura.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/diaCursoAsignatura/list'

        populateValidParams(params)
        def diaCursoAsignatura = new DiaCursoAsignatura(params)

        assert diaCursoAsignatura.save() != null

        params.id = diaCursoAsignatura.id

        def model = controller.show()

        assert model.diaCursoAsignaturaInstance == diaCursoAsignatura
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/diaCursoAsignatura/list'

        populateValidParams(params)
        def diaCursoAsignatura = new DiaCursoAsignatura(params)

        assert diaCursoAsignatura.save() != null

        params.id = diaCursoAsignatura.id

        def model = controller.edit()

        assert model.diaCursoAsignaturaInstance == diaCursoAsignatura
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/diaCursoAsignatura/list'

        response.reset()

        populateValidParams(params)
        def diaCursoAsignatura = new DiaCursoAsignatura(params)

        assert diaCursoAsignatura.save() != null

        // test invalid parameters in update
        params.id = diaCursoAsignatura.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/diaCursoAsignatura/edit"
        assert model.diaCursoAsignaturaInstance != null

        diaCursoAsignatura.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/diaCursoAsignatura/show/$diaCursoAsignatura.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        diaCursoAsignatura.clearErrors()

        populateValidParams(params)
        params.id = diaCursoAsignatura.id
        params.version = -1
        controller.update()

        assert view == "/diaCursoAsignatura/edit"
        assert model.diaCursoAsignaturaInstance != null
        assert model.diaCursoAsignaturaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/diaCursoAsignatura/list'

        response.reset()

        populateValidParams(params)
        def diaCursoAsignatura = new DiaCursoAsignatura(params)

        assert diaCursoAsignatura.save() != null
        assert DiaCursoAsignatura.count() == 1

        params.id = diaCursoAsignatura.id

        controller.delete()

        assert DiaCursoAsignatura.count() == 0
        assert DiaCursoAsignatura.get(diaCursoAsignatura.id) == null
        assert response.redirectedUrl == '/diaCursoAsignatura/list'
    }
}
