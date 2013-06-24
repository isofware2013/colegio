package cl.ucen.colegios

class Periodo {
    Date fechaInicio
    Date fechaTermino
    static constraints = {
    }
    String toString(){
        fechaInicio +'-'+fechaTermino
    }
}
