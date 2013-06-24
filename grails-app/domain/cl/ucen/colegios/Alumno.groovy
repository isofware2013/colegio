package cl.ucen.colegios

class Alumno extends Persona {
    String procedencia
    
    static hasMany = [relativos: RelativoAlumno, observaciones: Observacion]
    static constraints = {
        rut(unique: true,min: 1000,max: 49999999)
        digito(size: 1..1, matches: "[0-9Kk]")
        nombre()
        apellidoPaterno()
        apellidoMaterno()
        sexo()
        fechaNacimiento()
        emails()
        direcciones()
        telefonos()    
        procedencia()
        
    }
    
    String toString() {
        nombre + " " + apellidoPaterno
    }
    /*
    static constraints = {
        rut(range: 1000..49999999, nullable: false)
        digito(matches: "[0-9Kk]", size: 1..1) 
        nombre()
        apellidoPaterno()
        apellidoMaterno()
        sexo()
        fechaNacimiento()
        emails()
        direcciones()
        telefonos()
        procedencia()
        relativos()
        observaciones()
    }*/
}
