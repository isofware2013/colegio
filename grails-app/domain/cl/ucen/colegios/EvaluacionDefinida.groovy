package cl.ucen.colegios

class EvaluacionDefinida {

    int codigo
    String descripcion
    float ponderacion
    //static hasMany = [unidades: UnidadEvaluacionDefinida]
    
    static constraints = {
        codigo()
        descripcion()
        ponderacion()
        
    }
}
