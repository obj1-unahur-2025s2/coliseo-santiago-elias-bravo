import armas.*
import coliseo.*
import defensa.*

class Mirmillon {
  var vida = 100
  var armadura
  const armaDeMano 
  const property fuerza
  method destreza(){
    return 15
  }
  method cambiarArmadura(unaArmadura) {
     armadura = unaArmadura
  }
  method vida() {
    return vida
  } 
  method estaVivo(){
    return vida > 0
  }
  method ataque(){
    return fuerza + armaDeMano.ataque()
  }
  method defensa(){
    return self.destreza() + armadura.defensa(self)
  }
  method atacar(enemigo) {
    if(self.puedeInfringirDaño(enemigo) && enemigo.estaVivo()){
        enemigo.sufrirDaño(self.ataque() - enemigo.defensa())
    }
  }
  method puedeInfringirDaño(enemigo){
    return self.ataque() > enemigo.defensa()
  }
  method sufrirDaño(unValor){
    vida =(vida - unValor).max(0)
  }
  method pelear(enemigo){
    self.atacar(enemigo)
    enemigo.atacar(self)
  }
  method crearGrupo(otroGladiador){
    return new Grupo(nombre="mirmillolandia", gladiadores = #{self,otroGladiador})
  }
}
class Dimachaerus {
  var vida = 100
  const armaDeMano = new List()
  var destreza 

  method armadura(){}
  method vida() {
    return vida
  } 
  method estaVivo(){
    return vida > 0
  }
  method fuerza(){
    return 10
  }
  method ataque(){
    return self.fuerza() + armaDeMano.sum({a=>a.ataque()})
  }
  method defensa(){
    return destreza / 2
  }
  method puedeInfringirDaño(enemigo){
    return self.ataque() > enemigo.defensa()
  }
  method sufrirDaño(unValor){
    vida =(vida - unValor).max(0)
  }
  method atacar(enemigo) {
    if(self.puedeInfringirDaño(enemigo) && enemigo.estaVivo()){
        enemigo.sufrirDaño(self.ataque() - enemigo.defensa())
        destreza += 1
    }
  }
  method pelear(enemigo){
    self.atacar(enemigo)
    enemigo.atacar(self)
  }
  method curar(){
    vida = 100
  }
  method crearGrupo(otroGladiador){
    return new Grupo(nombre="D-" + (self.ataque() + otroGladiador.ataque()).toString() ,gladiadores = #{self,otroGladiador})
  }
}