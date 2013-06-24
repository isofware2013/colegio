package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(RelativoAlumnoController)
@Mock(RelativoAlumno)
class RelativoAlumnoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/relativoAlumno/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.relativoAlumnoInstanceList.size() == 0
        assert model.relativoAlumnoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.relativoAlumnoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.relativoAlumnoInstance != null
        assert view == '/relativoAlumno/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/relativoAlumno/show/1'
        assert controller.flash.message != null
        assert RelativoAlumno.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/relativoAlumno/list'

        populateValidParams(params)
        def relativoAlumno = new RelativoAlumno(params)

        assert relativoAlumno.save() != null

        params.id = relativoAlumno.id

        def model = controller.show()

        assert model.relativoAlumnoInstance == relativoAlumno
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/relativoAlumno/list'

        populateValidParams(params)
        def relativoAlumno = new RelativoAlumno(params)

        assert relativoAlumno.save() != null

        params.id = relativoAlumno.id

        def model = controller.edit()

        assert model.relativoAlumnoInstance == relativoAlumno
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/relativoAlumno/list'

        response.reset()

        populateValidParams(params)
        def relativoAlumno = new RelativoAlumno(params)

        assert relativoAlumno.save() != null

        // test invalid parameters in update
        params.id = relativoAlumno.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/relativoAlumno/edit"
        assert model.relativoAlumnoInstance != null

        relativoAlumno.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/relativoAlumno/show/$relativoAlumno.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        relativoAlumno.clearErrors()

        populateValidParams(params)
        params.id = relativoAlumno.id
        params.version = -1
        controller.update()

        assert view == "/relativoAlumno/edit"
        assert model.relativoAlumnoInstance != null
        assert model.relativoAlumnoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/relativoAlumno/list'

        response.reset()

        populateValidParams(params)
        def relativoAlumno = new RelativoAlumno(params)

        assert relativoAlumno.save() != null
        assert RelativoAlumno.count() == 1

        params.id = relativoAlumno.id

        controller.delete()

        assert RelativoAlumno.count() == 0
        assert RelativoAlumno.get(relativoAlumno.id) == null
        assert response.redirectedUrl == '/relativoAlumno/list'
    }
}
