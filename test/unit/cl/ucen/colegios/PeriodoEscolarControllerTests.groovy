package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(PeriodoEscolarController)
@Mock(PeriodoEscolar)
class PeriodoEscolarControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/periodoEscolar/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.periodoEscolarInstanceList.size() == 0
        assert model.periodoEscolarInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.periodoEscolarInstance != null
    }

    void testSave() {
        controller.save()

        assert model.periodoEscolarInstance != null
        assert view == '/periodoEscolar/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/periodoEscolar/show/1'
        assert controller.flash.message != null
        assert PeriodoEscolar.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/periodoEscolar/list'

        populateValidParams(params)
        def periodoEscolar = new PeriodoEscolar(params)

        assert periodoEscolar.save() != null

        params.id = periodoEscolar.id

        def model = controller.show()

        assert model.periodoEscolarInstance == periodoEscolar
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/periodoEscolar/list'

        populateValidParams(params)
        def periodoEscolar = new PeriodoEscolar(params)

        assert periodoEscolar.save() != null

        params.id = periodoEscolar.id

        def model = controller.edit()

        assert model.periodoEscolarInstance == periodoEscolar
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/periodoEscolar/list'

        response.reset()

        populateValidParams(params)
        def periodoEscolar = new PeriodoEscolar(params)

        assert periodoEscolar.save() != null

        // test invalid parameters in update
        params.id = periodoEscolar.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/periodoEscolar/edit"
        assert model.periodoEscolarInstance != null

        periodoEscolar.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/periodoEscolar/show/$periodoEscolar.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        periodoEscolar.clearErrors()

        populateValidParams(params)
        params.id = periodoEscolar.id
        params.version = -1
        controller.update()

        assert view == "/periodoEscolar/edit"
        assert model.periodoEscolarInstance != null
        assert model.periodoEscolarInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/periodoEscolar/list'

        response.reset()

        populateValidParams(params)
        def periodoEscolar = new PeriodoEscolar(params)

        assert periodoEscolar.save() != null
        assert PeriodoEscolar.count() == 1

        params.id = periodoEscolar.id

        controller.delete()

        assert PeriodoEscolar.count() == 0
        assert PeriodoEscolar.get(periodoEscolar.id) == null
        assert response.redirectedUrl == '/periodoEscolar/list'
    }
}
