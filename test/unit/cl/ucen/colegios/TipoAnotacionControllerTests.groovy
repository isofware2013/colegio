package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoAnotacionController)
@Mock(TipoAnotacion)
class TipoAnotacionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoAnotacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoAnotacionInstanceList.size() == 0
        assert model.tipoAnotacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tipoAnotacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoAnotacionInstance != null
        assert view == '/tipoAnotacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoAnotacion/show/1'
        assert controller.flash.message != null
        assert TipoAnotacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAnotacion/list'

        populateValidParams(params)
        def tipoAnotacion = new TipoAnotacion(params)

        assert tipoAnotacion.save() != null

        params.id = tipoAnotacion.id

        def model = controller.show()

        assert model.tipoAnotacionInstance == tipoAnotacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAnotacion/list'

        populateValidParams(params)
        def tipoAnotacion = new TipoAnotacion(params)

        assert tipoAnotacion.save() != null

        params.id = tipoAnotacion.id

        def model = controller.edit()

        assert model.tipoAnotacionInstance == tipoAnotacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoAnotacion/list'

        response.reset()

        populateValidParams(params)
        def tipoAnotacion = new TipoAnotacion(params)

        assert tipoAnotacion.save() != null

        // test invalid parameters in update
        params.id = tipoAnotacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoAnotacion/edit"
        assert model.tipoAnotacionInstance != null

        tipoAnotacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoAnotacion/show/$tipoAnotacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoAnotacion.clearErrors()

        populateValidParams(params)
        params.id = tipoAnotacion.id
        params.version = -1
        controller.update()

        assert view == "/tipoAnotacion/edit"
        assert model.tipoAnotacionInstance != null
        assert model.tipoAnotacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoAnotacion/list'

        response.reset()

        populateValidParams(params)
        def tipoAnotacion = new TipoAnotacion(params)

        assert tipoAnotacion.save() != null
        assert TipoAnotacion.count() == 1

        params.id = tipoAnotacion.id

        controller.delete()

        assert TipoAnotacion.count() == 0
        assert TipoAnotacion.get(tipoAnotacion.id) == null
        assert response.redirectedUrl == '/tipoAnotacion/list'
    }
}
