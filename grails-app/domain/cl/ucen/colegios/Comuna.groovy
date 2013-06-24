package cl.ucen.colegios

class Comuna {

    String nombre
    
    static belongsTo = [region: Region]
    
    static constraints = {
        nombre(nullable: false)
        region(nullable: false)
    }
    String toString(){
        nombre
    }
}
