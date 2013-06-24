
package cl.ucen.colegios


class CursoAsignaturaPeriodo {
    Curso curso
    //AsignaturaPeriodo asignaturaPeriodo
    Docente docente
    //Periodo periodo
    //Evaluaciones evaluaciones
    static hasMany  =  [diasHorarios: DiaSemanaHorario]
}

