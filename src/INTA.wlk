import Parcela.*

object inta {
	var parcelas = []
	
	method promedioPlantas() {
		 return parcelas.sum({parcela => parcela.plantasExistentes()}) / parcelas.size()
	}
	
}
