import gladiadores.*
import armas.*

object coliseo {
  const property grupos = #{}
  method combateEntreGrupos(unGrupo,otroGrupo){
    unGrupo.combatir(otroGrupo)
  }
  method combateDesigual(unGrupo, unGladiador){
    const unGrupoSolitario = new Grupo(nombre="solitario", gladiadores=#{unGladiador})
    unGrupo.combatir(unGrupoSolitario)
    grupos.add(unGrupoSolitario)
  }
  method curar() {
    grupos.forEach({g=>g.curar()})
  }
}

class Grupo{
    const property nombre
    const gladiadores = #{}
    var cantidadDePeleas = 0

    method agregarGladiador(unGladiador){
        gladiadores.add(unGladiador)
    } 
    method quitarGladiador(unGladiador){
        gladiadores.remove(unGladiador)
    }
    method gladiadoresVivos(){
        return gladiadores.filter({g=>g.estaVivo()})
    }
    method hayAlgunoVivo(){
        return gladiadores.any({g=>g.estaVivo()})
    }
    method campeon(){
        return self.gladiadoresVivos().max({g=>g.fuerza()})
    } 
    method pelearCon(otroGrupo) {
      if(self.hayAlgunoVivo() && otroGrupo.hayAlgunoVivo()){
        self.campeon().pelear(otroGrupo.campeon())
        cantidadDePeleas += 1
      }
    }
    method registrarPelea(){
        cantidadDePeleas += 1
    }
    method combatir(otroGrupo) {
      (1..3).forEach({self.pelearCon(otroGrupo)})
      self.registrarPelea()
      otroGrupo.registrarPelea()
    }
    method curar() {
      gladiadores.forEach({g=>g.curar()})
    }
}