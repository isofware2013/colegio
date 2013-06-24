package cl.ucen.colegios

class Observacion {
    TipoObservacion tipo
    String texto
    Date fechaIngreso
    static belongsTo = [alumno: Alumno, docente: Docente]
    static constraints = {
        tipo()
        fechaIngreso()
        alumno()
        texto()
    }
}
