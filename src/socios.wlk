import actividades.*

class Socio{
	const actividadesRealizadas = []
	var property maximoDeActs
	var property edad
	const property idiomasQueHabla = #{}

	method adoradorDelSol() = actividadesRealizadas.all({actividad => actividad.sirveParaBroncearse()})
	
	method actividadesEsforzadas() =  actividadesRealizadas.filter({actividad => actividad.requiereEsfuerzo()})
	
	method realizarActividad(unaActividad){
		//actividadesRealizadas = if (actividadesRealizadas.size() < maximoDeActs) 
		//actividadesRealizadas.add(unaActividad) else throw new Exception (message = "Maximo de actividades alcanzado")
		if(actividadesRealizadas.size() >= maximoDeActs){	
		 		throw new Exception (message = "Maximo de actividades alcanzado")
		 }
		actividadesRealizadas.add(unaActividad)	
	}
	
	method leAtrae(unaActividad)
}

class SocioTranquilo inherits Socio{
	override method leAtrae(unaActividad) = unaActividad.diasDeActividad() >= 4
}

class SocioCoherente inherits Socio{
	override method leAtrae(unaActividad) = (self.adoradorDelSol() and unaActividad.sirveParaBroncearse())
	or unaActividad.requiereEsfuerzo()
}

class SocioRelajado inherits Socio{
	override method leAtrae(unaActividad) = idiomasQueHabla.any({idioma => unaActividad.idioma().contains(idioma)})
}	/** not idiomasQueHabla.intersection(unaActividad.idioma()).isEmpty() */
