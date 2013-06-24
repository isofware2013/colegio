package cl.ucen.colegios

class Region {
    String nombre
    static hasMany = [comunas: Comuna]
    static constraints = {
        nombre(nullable: false)
        comunas(nullable: true)
    }
    
    String toString() {
        nombre
    }
}
