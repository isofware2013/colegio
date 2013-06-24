package cl.ucen.colegios

/**
 *
 * @author Seba
 */
class Persona {
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    int rut
    String digito
    Sexo sexo
    Date fechaNacimiento
    String emails
    static hasMany = [direcciones : Direccion, telefonos: Telefono]
    /*static mapping = {
        tablePerHierarchy = true
    }*/
    static constraints = {

    }
}

