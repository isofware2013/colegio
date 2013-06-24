package cl.ucen.colegios

class Direccion {

    String nombreCalle
    String numeracion
    String dependencia
    Comuna comuna
    TipoDireccion tipo
    
    static belongsTo = [persona: Persona]
    
    static constraints = {
        nombreCalle()
        numeracion()
        dependencia()
        comuna()
        tipo()
    }
}
