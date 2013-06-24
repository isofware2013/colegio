package cl.ucen.colegios

class PremioAcademico {
    

String premio

    static belongsTo = [docente: Docente]
    AntecedenteAcademico antecedenteAcademico

    static constraints = {
    }
}
