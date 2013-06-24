package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(DiaSemanaHorarioController)
@Mock(DiaSemanaHorario)
class DiaSemanaHorarioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/diaSemanaHorario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.diaSemanaHorarioInstanceList.size() == 0
        assert model.diaSemanaHorarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.diaSemanaHorarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.diaSemanaHorarioInstance != null
        assert view == '/diaSemanaHorario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/diaSemanaHorario/show/1'
        assert controller.flash.message != null
        assert DiaSemanaHorario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/diaSemanaHorario/list'

        populateValidParams(params)
        def diaSemanaHorario = new DiaSemanaHorario(params)

        assert diaSemanaHorario.save() != null

        params.id = diaSemanaHorario.id

        def model = controller.show()

        assert model.diaSemanaHorarioInstance == diaSemanaHorario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/diaSemanaHorario/list'

        populateValidParams(params)
        def diaSemanaHorario = new DiaSemanaHorario(params)

        assert diaSemanaHorario.save() != null

        params.id = diaSemanaHorario.id

        def model = controller.edit()

        assert model.diaSemanaHorarioInstance == diaSemanaHorario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/diaSemanaHorario/list'

        response.reset()

        populateValidParams(params)
        def diaSemanaHorario = new DiaSemanaHorario(params)

        assert diaSemanaHorario.save() != null

        // test invalid parameters in update
        params.id = diaSemanaHorario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/diaSemanaHorario/edit"
        assert model.diaSemanaHorarioInstance != null

        diaSemanaHorario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/diaSemanaHorario/show/$diaSemanaHorario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        diaSemanaHorario.clearErrors()

        populateValidParams(params)
        params.id = diaSemanaHorario.id
        params.version = -1
        controller.update()

        assert view == "/diaSemanaHorario/edit"
        assert model.diaSemanaHorarioInstance != null
        assert model.diaSemanaHorarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/diaSemanaHorario/list'

        response.reset()

        populateValidParams(params)
        def diaSemanaHorario = new DiaSemanaHorario(params)

        assert diaSemanaHorario.save() != null
        assert DiaSemanaHorario.count() == 1

        params.id = diaSemanaHorario.id

        controller.delete()

        assert DiaSemanaHorario.count() == 0
        assert DiaSemanaHorario.get(diaSemanaHorario.id) == null
        assert response.redirectedUrl == '/diaSemanaHorario/list'
    }
}
