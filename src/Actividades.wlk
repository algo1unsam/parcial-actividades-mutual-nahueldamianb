class Viaje {

	var property idiomas = []
	var property bronceado = false
	var property esfuerzo = false

	method esInteresante() = idiomas.size() > 1
	
	method esRecomendada(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self) and unSocio.actividades().any({a => a != self})
	}

}

class ViajePlaya inherits Viaje {

	var property longitud

	method dias() = longitud / 500

	override method bronceado() = true

	override method esfuerzo() = longitud > 1200

}

class ExcursionCiudad inherits Viaje {

	var property cantAtraccionesAVisitar
	var property tipoCiudad

	method dias() {
		if (self.tipoCiudad() == tropical) {
			return (cantAtraccionesAVisitar / 2) + 1
		} else {
			return cantAtraccionesAVisitar / 2
		}
	}

	override method bronceado() = self.tipoCiudad() == tropical

	override method esfuerzo() = cantAtraccionesAVisitar > 4

	override method esInteresante() {
		return super() or cantAtraccionesAVisitar == 5
	}

}

object tropical {

}

class SalidaTrekking inherits Viaje {

	var property kilometrosSendero
	var property diasSoleados

	method dias() = kilometrosSendero / 50

	override method esfuerzo() = kilometrosSendero > 80

	override method bronceado() = diasSoleados > 200 or (diasSoleados.between(100, 200) and kilometrosSendero > 120)

	override method esInteresante() {
		return super() and diasSoleados > 140
	}

}

class CalseGimnasia inherits Viaje {

	override method idiomas() {
		return [ "Espanol" ]
	}

	method dias() = 1

	override method bronceado() = false

	override method esfuerzo() = true

	override method esRecomendada(unSocio){
		return unSocio.edad().between(20,30)
	}

}


