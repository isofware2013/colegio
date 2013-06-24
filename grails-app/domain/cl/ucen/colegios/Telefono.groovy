package cl.ucen.colegios

class Telefono  {
    int numero
    int area
    TipoTelefono tipo
    static belongsTo = [persona: Persona]
    
    String toString(){
        "+(" + area + ") " + numero
        
    }
    
     /*static mapping = {
        table persona
        persona column: persona_id
    }*/
    static constraints = {
        area(min:1,max:999)
        numero(min:111111, max:99999999)
        tipo()
    }
    
}
