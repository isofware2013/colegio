package cl.ucen.colegios

class GradoAcademico {

    String grado
    AntecedenteAcademico antecedenteAcademico
    TipoGrado tipoGrado
    
    static belongsTo = [docente: Docente]
    
    static constraints = {
      
    }
}
