package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(EvaluacionController)
@Mock(Evaluacion)
class EvaluacionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/evaluacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.evaluacionInstanceList.size() == 0
        assert model.evaluacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.evaluacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.evaluacionInstance != null
        assert view == '/evaluacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/evaluacion/show/1'
        assert controller.flash.message != null
        assert Evaluacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/evaluacion/list'

        populateValidParams(params)
        def evaluacion = new Evaluacion(params)

        assert evaluacion.save() != null

        params.id = evaluacion.id

        def model = controller.show()

        assert model.evaluacionInstance == evaluacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/evaluacion/list'

        populateValidParams(params)
        def evaluacion = new Evaluacion(params)

        assert evaluacion.save() != null

        params.id = evaluacion.id

        def model = controller.edit()

        assert model.evaluacionInstance == evaluacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/evaluacion/list'

        response.reset()

        populateValidParams(params)
        def evaluacion = new Evaluacion(params)

        assert evaluacion.save() != null

        // test invalid parameters in update
        params.id = evaluacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/evaluacion/edit"
        assert model.evaluacionInstance != null

        evaluacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/evaluacion/show/$evaluacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        evaluacion.clearErrors()

        populateValidParams(params)
        params.id = evaluacion.id
        params.version = -1
        controller.update()

        assert view == "/evaluacion/edit"
        assert model.evaluacionInstance != null
        assert model.evaluacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/evaluacion/list'

        response.reset()

        populateValidParams(params)
        def evaluacion = new Evaluacion(params)

        assert evaluacion.save() != null
        assert Evaluacion.count() == 1

        params.id = evaluacion.id

        controller.delete()

        assert Evaluacion.count() == 0
        assert Evaluacion.get(evaluacion.id) == null
        assert response.redirectedUrl == '/evaluacion/list'
    }
}
