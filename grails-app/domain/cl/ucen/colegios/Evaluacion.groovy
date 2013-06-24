package cl.ucen.colegios

class Evaluacion {
    EvaluacionDefinida evaluacionDefinida
    CursoAsignaturaPeriodo cursoAsignaturaPeriodo //falta crear
    Date fechaPlanificada
    Date fechaReal
    float ponderacion
    TipoEvaluacion tipo
    String descripcion
    
    static belongsTo = [calificacionEvaluacion: CalificacionEvaluacion]
    static hasMany = [calificaciones: CalificacionEvaluacion]


    static constraints = {
        evaluacionDefinida()
        cursoAsignaturaPeriodo()
        fechaPlanificada()
        fechaReal()
        ponderacion()
        tipo()
        descripcion()        
    }
}
