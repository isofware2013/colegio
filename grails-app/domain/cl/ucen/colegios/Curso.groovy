package cl.ucen.colegios

class Curso {

    PeriodoEscolar periodoEscolar
    //static hasMany =[alumnos: AlumnoCurso]
    Docente profesorJefe
    CursoAsignaturaPeriodo asignaturas//No se si está bien
    String descripcion
    Nivel nivel
    Jornada jornada
    
    //static belongsTo = [curso: AlumnoCurso, curso: CursoAsignaturaPeriodo]
    
    static constraints = {
        periodoEscolar()
        profesorJefe()
        asignaturas()
        descripcion()
        
    }
}

