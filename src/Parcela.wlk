import semillas.*

class Parcela {
	var property largo = 1
	var property ancho =  2
	var property horasDeSol = 10
	var plantas = []
	
	// metodo agregado para el punto 6
	method plantasExistentes() = plantas
	method superficie() = largo * ancho
	method cantidadMaxima()  {
		var maximo = 0
		if(ancho > largo ){
			maximo = self.superficie()/5
		}
		else {
			maximo = self.superficie()/ 3 + largo
		}
		return maximo
	}
	
	method tieneComplicaciones() = plantas.any({planta => planta.horasDeSolQueTolera() < horasDeSol})
	method plantarUnaPlanta(planta)  {
		plantas.add(planta)
		if( self.parcelaLLena() or self.superaLaCantidad(planta) ){
			self.error("no es posible seguir plantando")
		} else {
			plantas.add(planta)
		}
	}
	
	method parcelaLLena() = plantas.size() == self.cantidadMaxima()
	method recibeMasSol(planta) =  horasDeSol - planta.horasDeSolQueTolera()
	method superaLaCantidad(planta)  = self.recibeMasSol(planta) >= 2
	
	method plantasPequenias() = plantas.all({planta => planta.altura() < 1.5})
	
}
