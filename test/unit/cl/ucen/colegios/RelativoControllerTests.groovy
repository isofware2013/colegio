package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(RelativoController)
@Mock(Relativo)
class RelativoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/relativo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.relativoInstanceList.size() == 0
        assert model.relativoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.relativoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.relativoInstance != null
        assert view == '/relativo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/relativo/show/1'
        assert controller.flash.message != null
        assert Relativo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/relativo/list'

        populateValidParams(params)
        def relativo = new Relativo(params)

        assert relativo.save() != null

        params.id = relativo.id

        def model = controller.show()

        assert model.relativoInstance == relativo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/relativo/list'

        populateValidParams(params)
        def relativo = new Relativo(params)

        assert relativo.save() != null

        params.id = relativo.id

        def model = controller.edit()

        assert model.relativoInstance == relativo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/relativo/list'

        response.reset()

        populateValidParams(params)
        def relativo = new Relativo(params)

        assert relativo.save() != null

        // test invalid parameters in update
        params.id = relativo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/relativo/edit"
        assert model.relativoInstance != null

        relativo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/relativo/show/$relativo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        relativo.clearErrors()

        populateValidParams(params)
        params.id = relativo.id
        params.version = -1
        controller.update()

        assert view == "/relativo/edit"
        assert model.relativoInstance != null
        assert model.relativoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/relativo/list'

        response.reset()

        populateValidParams(params)
        def relativo = new Relativo(params)

        assert relativo.save() != null
        assert Relativo.count() == 1

        params.id = relativo.id

        controller.delete()

        assert Relativo.count() == 0
        assert Relativo.get(relativo.id) == null
        assert response.redirectedUrl == '/relativo/list'
    }
}
