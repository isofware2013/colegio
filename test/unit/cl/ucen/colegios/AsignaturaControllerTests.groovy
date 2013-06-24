package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(AsignaturaController)
@Mock(Asignatura)
class AsignaturaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/asignatura/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.asignaturaInstanceList.size() == 0
        assert model.asignaturaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.asignaturaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.asignaturaInstance != null
        assert view == '/asignatura/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/asignatura/show/1'
        assert controller.flash.message != null
        assert Asignatura.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/asignatura/list'

        populateValidParams(params)
        def asignatura = new Asignatura(params)

        assert asignatura.save() != null

        params.id = asignatura.id

        def model = controller.show()

        assert model.asignaturaInstance == asignatura
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/asignatura/list'

        populateValidParams(params)
        def asignatura = new Asignatura(params)

        assert asignatura.save() != null

        params.id = asignatura.id

        def model = controller.edit()

        assert model.asignaturaInstance == asignatura
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/asignatura/list'

        response.reset()

        populateValidParams(params)
        def asignatura = new Asignatura(params)

        assert asignatura.save() != null

        // test invalid parameters in update
        params.id = asignatura.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/asignatura/edit"
        assert model.asignaturaInstance != null

        asignatura.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/asignatura/show/$asignatura.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        asignatura.clearErrors()

        populateValidParams(params)
        params.id = asignatura.id
        params.version = -1
        controller.update()

        assert view == "/asignatura/edit"
        assert model.asignaturaInstance != null
        assert model.asignaturaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/asignatura/list'

        response.reset()

        populateValidParams(params)
        def asignatura = new Asignatura(params)

        assert asignatura.save() != null
        assert Asignatura.count() == 1

        params.id = asignatura.id

        controller.delete()

        assert Asignatura.count() == 0
        assert Asignatura.get(asignatura.id) == null
        assert response.redirectedUrl == '/asignatura/list'
    }
}
