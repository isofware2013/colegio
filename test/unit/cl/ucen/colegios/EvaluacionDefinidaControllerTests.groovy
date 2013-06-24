package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(EvaluacionDefinidaController)
@Mock(EvaluacionDefinida)
class EvaluacionDefinidaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/evaluacionDefinida/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.evaluacionDefinidaInstanceList.size() == 0
        assert model.evaluacionDefinidaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.evaluacionDefinidaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.evaluacionDefinidaInstance != null
        assert view == '/evaluacionDefinida/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/evaluacionDefinida/show/1'
        assert controller.flash.message != null
        assert EvaluacionDefinida.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/evaluacionDefinida/list'

        populateValidParams(params)
        def evaluacionDefinida = new EvaluacionDefinida(params)

        assert evaluacionDefinida.save() != null

        params.id = evaluacionDefinida.id

        def model = controller.show()

        assert model.evaluacionDefinidaInstance == evaluacionDefinida
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/evaluacionDefinida/list'

        populateValidParams(params)
        def evaluacionDefinida = new EvaluacionDefinida(params)

        assert evaluacionDefinida.save() != null

        params.id = evaluacionDefinida.id

        def model = controller.edit()

        assert model.evaluacionDefinidaInstance == evaluacionDefinida
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/evaluacionDefinida/list'

        response.reset()

        populateValidParams(params)
        def evaluacionDefinida = new EvaluacionDefinida(params)

        assert evaluacionDefinida.save() != null

        // test invalid parameters in update
        params.id = evaluacionDefinida.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/evaluacionDefinida/edit"
        assert model.evaluacionDefinidaInstance != null

        evaluacionDefinida.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/evaluacionDefinida/show/$evaluacionDefinida.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        evaluacionDefinida.clearErrors()

        populateValidParams(params)
        params.id = evaluacionDefinida.id
        params.version = -1
        controller.update()

        assert view == "/evaluacionDefinida/edit"
        assert model.evaluacionDefinidaInstance != null
        assert model.evaluacionDefinidaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/evaluacionDefinida/list'

        response.reset()

        populateValidParams(params)
        def evaluacionDefinida = new EvaluacionDefinida(params)

        assert evaluacionDefinida.save() != null
        assert EvaluacionDefinida.count() == 1

        params.id = evaluacionDefinida.id

        controller.delete()

        assert EvaluacionDefinida.count() == 0
        assert EvaluacionDefinida.get(evaluacionDefinida.id) == null
        assert response.redirectedUrl == '/evaluacionDefinida/list'
    }
}
