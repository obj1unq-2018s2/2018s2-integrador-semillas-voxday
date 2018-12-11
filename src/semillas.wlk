import Parcela.*

class Planta {
	var property altura 
	const property anioObtencion = 1900
	
	method esFuerte() = self.horasDeSolQueTolera() > 10
	method horasDeSolQueTolera()
	method daNuevasSemillas() = self.esFuerte()
	
}

class Menta inherits Planta {
	method altura() = altura
	override method horasDeSolQueTolera() = 6
	override method daNuevasSemillas() = super() or self.condAlternativa()
	method condAlternativa() = altura > 0.4
	method espacioOcupado() = altura * 3
	method parcelaIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta {
	override method horasDeSolQueTolera() {
		var tolerancia = 0
		if(altura < 0.5){
			tolerancia = 6
		}
		if(altura.between(0.5,1)){
			tolerancia = 7
		} 
		else {
			tolerancia = 9
		}
		return tolerancia
	}
  override method daNuevasSemillas() = super() or self.condAlternativa()
	
	method condAlternativa() = anioObtencion > 2007 and altura > 1
	method espacioOcupado() = altura *0.5
	method parcelaIdeal(parcela) = parcela.horasDeSol() == self.horasDeSolQueTolera() 
}


class Quinoa inherits Planta {
	var property horasToleradas 
	method espacioOcupado() = 0.5
	method condAlternativa() = anioObtencion < 2004
	override method horasDeSolQueTolera() = horasToleradas
	method parcelaIdeal(parcela) = parcela.plantasPequenias()
	override method daNuevasSemillas() = super() or self.condAlternativa()
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	override method parcelaIdeal(parcela) = parcela.cantidadMaxima() == 1
}

class Hierbabuena inherits Menta {
	override method espacioOcupado() = super() * 2
}

