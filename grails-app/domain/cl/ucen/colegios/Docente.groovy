package cl.ucen.colegios

class Docente extends Persona{
    
   
    static hasMany = [premioAcademico: PremioAcademico, gradoAcademico : GradoAcademico, observaciones: Observacion, asignaturas: Asignatura]
    static constraints = {
        rut(unique: true,min: 1000,max: 49999999)
        digito(size: 1..1, matches: "[0-9Kk]")
        nombre()
        apellidoPaterno()
        apellidoMaterno()
        sexo()
        fechaNacimiento()
        emails()
        premioAcademico()
        
    }
}
