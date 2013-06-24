package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(AnotacionController)
@Mock(Anotacion)
class AnotacionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/anotacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.anotacionInstanceList.size() == 0
        assert model.anotacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.anotacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.anotacionInstance != null
        assert view == '/anotacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/anotacion/show/1'
        assert controller.flash.message != null
        assert Anotacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/anotacion/list'

        populateValidParams(params)
        def anotacion = new Anotacion(params)

        assert anotacion.save() != null

        params.id = anotacion.id

        def model = controller.show()

        assert model.anotacionInstance == anotacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/anotacion/list'

        populateValidParams(params)
        def anotacion = new Anotacion(params)

        assert anotacion.save() != null

        params.id = anotacion.id

        def model = controller.edit()

        assert model.anotacionInstance == anotacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/anotacion/list'

        response.reset()

        populateValidParams(params)
        def anotacion = new Anotacion(params)

        assert anotacion.save() != null

        // test invalid parameters in update
        params.id = anotacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/anotacion/edit"
        assert model.anotacionInstance != null

        anotacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/anotacion/show/$anotacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        anotacion.clearErrors()

        populateValidParams(params)
        params.id = anotacion.id
        params.version = -1
        controller.update()

        assert view == "/anotacion/edit"
        assert model.anotacionInstance != null
        assert model.anotacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/anotacion/list'

        response.reset()

        populateValidParams(params)
        def anotacion = new Anotacion(params)

        assert anotacion.save() != null
        assert Anotacion.count() == 1

        params.id = anotacion.id

        controller.delete()

        assert Anotacion.count() == 0
        assert Anotacion.get(anotacion.id) == null
        assert response.redirectedUrl == '/anotacion/list'
    }
}
