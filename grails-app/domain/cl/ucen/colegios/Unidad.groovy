package cl.ucen.colegios

class Unidad {
    String objetivo
    String objetivosEspecificos
    String nombre
    int cantidadHorasTeoricas
    int cantidadHorasPracticas
    static hasMany = [evaluacionesDefinidas: EvaluacionDefinida]
    //static belongsTo = [unidades: AsignaturaPeriodo]
    static constraints = {
        objetivo ()
        objetivosEspecificos()
        nombre()
        cantidadHorasTeoricas()
        cantidadHorasPracticas()
    }
}
