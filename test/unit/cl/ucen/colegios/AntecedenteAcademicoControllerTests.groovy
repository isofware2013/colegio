package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(AntecedenteAcademicoController)
@Mock(AntecedenteAcademico)
class AntecedenteAcademicoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/antecedenteAcademico/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.antecedenteAcademicoInstanceList.size() == 0
        assert model.antecedenteAcademicoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.antecedenteAcademicoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.antecedenteAcademicoInstance != null
        assert view == '/antecedenteAcademico/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/antecedenteAcademico/show/1'
        assert controller.flash.message != null
        assert AntecedenteAcademico.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/antecedenteAcademico/list'

        populateValidParams(params)
        def antecedenteAcademico = new AntecedenteAcademico(params)

        assert antecedenteAcademico.save() != null

        params.id = antecedenteAcademico.id

        def model = controller.show()

        assert model.antecedenteAcademicoInstance == antecedenteAcademico
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/antecedenteAcademico/list'

        populateValidParams(params)
        def antecedenteAcademico = new AntecedenteAcademico(params)

        assert antecedenteAcademico.save() != null

        params.id = antecedenteAcademico.id

        def model = controller.edit()

        assert model.antecedenteAcademicoInstance == antecedenteAcademico
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/antecedenteAcademico/list'

        response.reset()

        populateValidParams(params)
        def antecedenteAcademico = new AntecedenteAcademico(params)

        assert antecedenteAcademico.save() != null

        // test invalid parameters in update
        params.id = antecedenteAcademico.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/antecedenteAcademico/edit"
        assert model.antecedenteAcademicoInstance != null

        antecedenteAcademico.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/antecedenteAcademico/show/$antecedenteAcademico.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        antecedenteAcademico.clearErrors()

        populateValidParams(params)
        params.id = antecedenteAcademico.id
        params.version = -1
        controller.update()

        assert view == "/antecedenteAcademico/edit"
        assert model.antecedenteAcademicoInstance != null
        assert model.antecedenteAcademicoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/antecedenteAcademico/list'

        response.reset()

        populateValidParams(params)
        def antecedenteAcademico = new AntecedenteAcademico(params)

        assert antecedenteAcademico.save() != null
        assert AntecedenteAcademico.count() == 1

        params.id = antecedenteAcademico.id

        controller.delete()

        assert AntecedenteAcademico.count() == 0
        assert AntecedenteAcademico.get(antecedenteAcademico.id) == null
        assert response.redirectedUrl == '/antecedenteAcademico/list'
    }
}
