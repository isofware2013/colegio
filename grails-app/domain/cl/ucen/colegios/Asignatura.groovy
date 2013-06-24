package cl.ucen.colegios

class Asignatura {
   
    String nombre
   int codigo
   String descripcion
   Nivel nivel
   
   static belongsTo = [docente : Docente]
   
    static constraints = {
       codigo(nullable: false)
        descripcion(nullable: false)
        nivel(nullable: false)
    }
}


