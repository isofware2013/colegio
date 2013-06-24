package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(GradoAcademicoController)
@Mock(GradoAcademico)
class GradoAcademicoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gradoAcademico/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gradoAcademicoInstanceList.size() == 0
        assert model.gradoAcademicoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.gradoAcademicoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gradoAcademicoInstance != null
        assert view == '/gradoAcademico/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gradoAcademico/show/1'
        assert controller.flash.message != null
        assert GradoAcademico.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gradoAcademico/list'

        populateValidParams(params)
        def gradoAcademico = new GradoAcademico(params)

        assert gradoAcademico.save() != null

        params.id = gradoAcademico.id

        def model = controller.show()

        assert model.gradoAcademicoInstance == gradoAcademico
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gradoAcademico/list'

        populateValidParams(params)
        def gradoAcademico = new GradoAcademico(params)

        assert gradoAcademico.save() != null

        params.id = gradoAcademico.id

        def model = controller.edit()

        assert model.gradoAcademicoInstance == gradoAcademico
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gradoAcademico/list'

        response.reset()

        populateValidParams(params)
        def gradoAcademico = new GradoAcademico(params)

        assert gradoAcademico.save() != null

        // test invalid parameters in update
        params.id = gradoAcademico.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gradoAcademico/edit"
        assert model.gradoAcademicoInstance != null

        gradoAcademico.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gradoAcademico/show/$gradoAcademico.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gradoAcademico.clearErrors()

        populateValidParams(params)
        params.id = gradoAcademico.id
        params.version = -1
        controller.update()

        assert view == "/gradoAcademico/edit"
        assert model.gradoAcademicoInstance != null
        assert model.gradoAcademicoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gradoAcademico/list'

        response.reset()

        populateValidParams(params)
        def gradoAcademico = new GradoAcademico(params)

        assert gradoAcademico.save() != null
        assert GradoAcademico.count() == 1

        params.id = gradoAcademico.id

        controller.delete()

        assert GradoAcademico.count() == 0
        assert GradoAcademico.get(gradoAcademico.id) == null
        assert response.redirectedUrl == '/gradoAcademico/list'
    }
}
