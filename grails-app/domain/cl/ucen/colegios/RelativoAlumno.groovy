package cl.ucen.colegios

class RelativoAlumno {
    TipoRelativo tipo
    static belongsTo = [alumno: Alumno, relativo: Relativo]
    static constraints = {
    }
}
