package cl.ucen.colegios

class DiaCursoAsignatura {
    
    CursoAsignaturaPeriodo cursoAsignaturaPeriodo
    Date fecha
    int asistentes
    static hasMany = [anotaciones : Anotacion]    
    
    static constraints = {
    }
}
