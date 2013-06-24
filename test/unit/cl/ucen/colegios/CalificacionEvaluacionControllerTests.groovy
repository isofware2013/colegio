package cl.ucen.colegios



import org.junit.*
import grails.test.mixin.*

@TestFor(CalificacionEvaluacionController)
@Mock(CalificacionEvaluacion)
class CalificacionEvaluacionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/calificacionEvaluacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.calificacionEvaluacionInstanceList.size() == 0
        assert model.calificacionEvaluacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.calificacionEvaluacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.calificacionEvaluacionInstance != null
        assert view == '/calificacionEvaluacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/calificacionEvaluacion/show/1'
        assert controller.flash.message != null
        assert CalificacionEvaluacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/calificacionEvaluacion/list'

        populateValidParams(params)
        def calificacionEvaluacion = new CalificacionEvaluacion(params)

        assert calificacionEvaluacion.save() != null

        params.id = calificacionEvaluacion.id

        def model = controller.show()

        assert model.calificacionEvaluacionInstance == calificacionEvaluacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/calificacionEvaluacion/list'

        populateValidParams(params)
        def calificacionEvaluacion = new CalificacionEvaluacion(params)

        assert calificacionEvaluacion.save() != null

        params.id = calificacionEvaluacion.id

        def model = controller.edit()

        assert model.calificacionEvaluacionInstance == calificacionEvaluacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/calificacionEvaluacion/list'

        response.reset()

        populateValidParams(params)
        def calificacionEvaluacion = new CalificacionEvaluacion(params)

        assert calificacionEvaluacion.save() != null

        // test invalid parameters in update
        params.id = calificacionEvaluacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/calificacionEvaluacion/edit"
        assert model.calificacionEvaluacionInstance != null

        calificacionEvaluacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/calificacionEvaluacion/show/$calificacionEvaluacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        calificacionEvaluacion.clearErrors()

        populateValidParams(params)
        params.id = calificacionEvaluacion.id
        params.version = -1
        controller.update()

        assert view == "/calificacionEvaluacion/edit"
        assert model.calificacionEvaluacionInstance != null
        assert model.calificacionEvaluacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/calificacionEvaluacion/list'

        response.reset()

        populateValidParams(params)
        def calificacionEvaluacion = new CalificacionEvaluacion(params)

        assert calificacionEvaluacion.save() != null
        assert CalificacionEvaluacion.count() == 1

        params.id = calificacionEvaluacion.id

        controller.delete()

        assert CalificacionEvaluacion.count() == 0
        assert CalificacionEvaluacion.get(calificacionEvaluacion.id) == null
        assert response.redirectedUrl == '/calificacionEvaluacion/list'
    }
}
