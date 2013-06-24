package cl.ucen.colegios

class Relativo extends Persona {
    String nivelEstudio
    String profesion
    static hasMany = [alumnos: RelativoAlumno]
    static constraints = {
        rut(unique: true,min: 1000,max: 49999999)
        digito(size: 1..1, matches: "[0-9Kk]")
        nombre()
        apellidoPaterno()
        apellidoMaterno()
        sexo()
        fechaNacimiento()
        nivelEstudio()
        profesion()
        alumnos()
        emails()
        direcciones()
        telefonos()
    }
}
