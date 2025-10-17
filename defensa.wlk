import gladiadores.*
import coliseo.*
import armas.*
object casco {
  method armadura(unGladiador){
    return 10
  } 
}
object escudo {
  method armadura(unGladiador) {
    return 5 +(unGladiador.destreza()*0.10)
  }
}