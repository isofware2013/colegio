package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(PremioAcademicoController)
@Mock(PremioAcademico)
class PremioAcademicoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/premioAcademico/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.premioAcademicoInstanceList.size() == 0
        assert model.premioAcademicoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.premioAcademicoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.premioAcademicoInstance != null
        assert view == '/premioAcademico/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/premioAcademico/show/1'
        assert controller.flash.message != null
        assert PremioAcademico.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/premioAcademico/list'

        populateValidParams(params)
        def premioAcademico = new PremioAcademico(params)

        assert premioAcademico.save() != null

        params.id = premioAcademico.id

        def model = controller.show()

        assert model.premioAcademicoInstance == premioAcademico
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/premioAcademico/list'

        populateValidParams(params)
        def premioAcademico = new PremioAcademico(params)

        assert premioAcademico.save() != null

        params.id = premioAcademico.id

        def model = controller.edit()

        assert model.premioAcademicoInstance == premioAcademico
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/premioAcademico/list'

        response.reset()

        populateValidParams(params)
        def premioAcademico = new PremioAcademico(params)

        assert premioAcademico.save() != null

        // test invalid parameters in update
        params.id = premioAcademico.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/premioAcademico/edit"
        assert model.premioAcademicoInstance != null

        premioAcademico.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/premioAcademico/show/$premioAcademico.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        premioAcademico.clearErrors()

        populateValidParams(params)
        params.id = premioAcademico.id
        params.version = -1
        controller.update()

        assert view == "/premioAcademico/edit"
        assert model.premioAcademicoInstance != null
        assert model.premioAcademicoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/premioAcademico/list'

        response.reset()

        populateValidParams(params)
        def premioAcademico = new PremioAcademico(params)

        assert premioAcademico.save() != null
        assert PremioAcademico.count() == 1

        params.id = premioAcademico.id

        controller.delete()

        assert PremioAcademico.count() == 0
        assert PremioAcademico.get(premioAcademico.id) == null
        assert response.redirectedUrl == '/premioAcademico/list'
    }
}
