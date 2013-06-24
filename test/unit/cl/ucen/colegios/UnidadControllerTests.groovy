package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(UnidadController)
@Mock(Unidad)
class UnidadControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/unidad/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.unidadInstanceList.size() == 0
        assert model.unidadInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.unidadInstance != null
    }

    void testSave() {
        controller.save()

        assert model.unidadInstance != null
        assert view == '/unidad/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/unidad/show/1'
        assert controller.flash.message != null
        assert Unidad.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/unidad/list'

        populateValidParams(params)
        def unidad = new Unidad(params)

        assert unidad.save() != null

        params.id = unidad.id

        def model = controller.show()

        assert model.unidadInstance == unidad
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/unidad/list'

        populateValidParams(params)
        def unidad = new Unidad(params)

        assert unidad.save() != null

        params.id = unidad.id

        def model = controller.edit()

        assert model.unidadInstance == unidad
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/unidad/list'

        response.reset()

        populateValidParams(params)
        def unidad = new Unidad(params)

        assert unidad.save() != null

        // test invalid parameters in update
        params.id = unidad.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/unidad/edit"
        assert model.unidadInstance != null

        unidad.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/unidad/show/$unidad.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        unidad.clearErrors()

        populateValidParams(params)
        params.id = unidad.id
        params.version = -1
        controller.update()

        assert view == "/unidad/edit"
        assert model.unidadInstance != null
        assert model.unidadInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/unidad/list'

        response.reset()

        populateValidParams(params)
        def unidad = new Unidad(params)

        assert unidad.save() != null
        assert Unidad.count() == 1

        params.id = unidad.id

        controller.delete()

        assert Unidad.count() == 0
        assert Unidad.get(unidad.id) == null
        assert response.redirectedUrl == '/unidad/list'
    }
}
