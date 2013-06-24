package cl.ucen.colegios

class Anotacion {

    DiaCursoAsignatura diaCursoAsignatura
    String alumnoCurso
    static hasMany  = [tipo : TipoAnotacion]
    String texto
    
    static belongsTo  = [diaCursoAsignatura: DiaCursoAsignatura] //es neceario si ya esta declarado?
    
    
    static constraints = {
    }
}
