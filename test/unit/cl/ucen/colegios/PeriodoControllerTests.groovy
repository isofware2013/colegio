package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(PeriodoController)
@Mock(Periodo)
class PeriodoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/periodo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.periodoInstanceList.size() == 0
        assert model.periodoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.periodoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.periodoInstance != null
        assert view == '/periodo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/periodo/show/1'
        assert controller.flash.message != null
        assert Periodo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/periodo/list'

        populateValidParams(params)
        def periodo = new Periodo(params)

        assert periodo.save() != null

        params.id = periodo.id

        def model = controller.show()

        assert model.periodoInstance == periodo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/periodo/list'

        populateValidParams(params)
        def periodo = new Periodo(params)

        assert periodo.save() != null

        params.id = periodo.id

        def model = controller.edit()

        assert model.periodoInstance == periodo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/periodo/list'

        response.reset()

        populateValidParams(params)
        def periodo = new Periodo(params)

        assert periodo.save() != null

        // test invalid parameters in update
        params.id = periodo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/periodo/edit"
        assert model.periodoInstance != null

        periodo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/periodo/show/$periodo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        periodo.clearErrors()

        populateValidParams(params)
        params.id = periodo.id
        params.version = -1
        controller.update()

        assert view == "/periodo/edit"
        assert model.periodoInstance != null
        assert model.periodoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/periodo/list'

        response.reset()

        populateValidParams(params)
        def periodo = new Periodo(params)

        assert periodo.save() != null
        assert Periodo.count() == 1

        params.id = periodo.id

        controller.delete()

        assert Periodo.count() == 0
        assert Periodo.get(periodo.id) == null
        assert response.redirectedUrl == '/periodo/list'
    }
}
