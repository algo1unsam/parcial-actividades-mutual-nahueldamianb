import Actividades.*


class Socio {

	var property actividades = []
	var property cantidadMaximaDeActividades
	var property edad
	var property idiomasQueConoce = []
	var property tipo

	method registrarActividad(unaActividad) {
		if (actividades.size() == cantidadMaximaDeActividades) {
			self.error("Ya no puede seguir registrando Actividades")
		} else {
			actividades.add(unaActividad)
		}
	}

	method esAdoradorAlSol() {
		return actividades.all({ unaA => unaA.bronceado() })
	}

	method actividadesImplicanEsfuerzo() {
		return actividades.map({ unaA => unaA.esfuerzo() }) //Filter
	}

	method leAtrae(unaActividad) {
		return self.tipo().actividadInteresante(unaActividad, self)
	}

	method esRecomendada(unaActividad) {
		return unaActividad.esRecomendada(self)
		
	}

}

object tranquilo {

	method actividadInteresante(unaActividad, unSocio) {
		return unaActividad.dias() > 3
	}

}

object coherente {

	method actividadInteresante(unaActividad, unSocio) {
		if (unSocio.esAdoradorAlSol()) {
			return unaActividad.bronceado()
		} else return unaActividad.esfuerzo()
	}

}

object relajado {

	method actividadInteresante(unaActividad, unSocio) {
		return unaActividad.idiomas().intersection({ unSocio.idiomasQueConoce() }).size() > 0 // mas facil con any
	}

}
