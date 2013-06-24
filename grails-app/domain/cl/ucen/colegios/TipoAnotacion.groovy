package cl.ucen.colegios

class TipoAnotacion {

    String nombre
    String descripcion
    String plantilla
    
        static belongsTo = [tipo: Anotacion]
        
    static constraints = {
    }
}
