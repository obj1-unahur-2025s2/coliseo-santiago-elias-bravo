import gladiadores.*
import coliseo.*
import defensa.*
class ArmaDeFilo{
    const property longitud
    const filo

    method initialize(){
        if(!filo.between(0, 1)){
            self.error("filo entre 0 y 1")
        }
        if(longitud < 0){
            self.error("Tiene que ser mayor o igual a cero")
        }
    }
    method valorDeAtaque(){
        return filo * longitud
    }
}
class ArmaContundente{
    const property peso
    method valorDeAtaque() {
      return peso
    } 
}

