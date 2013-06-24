package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(DireccionController)
@Mock(Direccion)
class DireccionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/direccion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.direccionInstanceList.size() == 0
        assert model.direccionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.direccionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.direccionInstance != null
        assert view == '/direccion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/direccion/show/1'
        assert controller.flash.message != null
        assert Direccion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/direccion/list'

        populateValidParams(params)
        def direccion = new Direccion(params)

        assert direccion.save() != null

        params.id = direccion.id

        def model = controller.show()

        assert model.direccionInstance == direccion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/direccion/list'

        populateValidParams(params)
        def direccion = new Direccion(params)

        assert direccion.save() != null

        params.id = direccion.id

        def model = controller.edit()

        assert model.direccionInstance == direccion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/direccion/list'

        response.reset()

        populateValidParams(params)
        def direccion = new Direccion(params)

        assert direccion.save() != null

        // test invalid parameters in update
        params.id = direccion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/direccion/edit"
        assert model.direccionInstance != null

        direccion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/direccion/show/$direccion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        direccion.clearErrors()

        populateValidParams(params)
        params.id = direccion.id
        params.version = -1
        controller.update()

        assert view == "/direccion/edit"
        assert model.direccionInstance != null
        assert model.direccionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/direccion/list'

        response.reset()

        populateValidParams(params)
        def direccion = new Direccion(params)

        assert direccion.save() != null
        assert Direccion.count() == 1

        params.id = direccion.id

        controller.delete()

        assert Direccion.count() == 0
        assert Direccion.get(direccion.id) == null
        assert response.redirectedUrl == '/direccion/list'
    }
}
