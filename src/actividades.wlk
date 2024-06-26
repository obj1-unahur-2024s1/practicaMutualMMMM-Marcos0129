import socios.*

class Actividad{	
	var property idioma = #{}
	
	method requiereEsfuerzo() 
	method sirveParaBroncearse()
	method diasDeActividad()
	method esInteresante() = idioma.size() > 1
	method esRecomendadaPara(unSocio)
}

class Viaje inherits Actividad{
	override method esRecomendadaPara(unSocio) = self.esInteresante() and unSocio.leAtrae(self) and 
	!(unSocio.actividadesRealizadas().contains(self))
}

class ViajePlaya inherits Viaje{
	var property largoDePlaya
	
	override method diasDeActividad() = largoDePlaya / 500
	override method requiereEsfuerzo() = largoDePlaya > 1200
	override method sirveParaBroncearse() = true
}

class ExcursionALaCiudad inherits Viaje{
	
	var property cantidadDeAtraccionesAVisitar
	
	override method diasDeActividad() = cantidadDeAtraccionesAVisitar/2
	override method requiereEsfuerzo() = cantidadDeAtraccionesAVisitar.between(5,8)
	override method sirveParaBroncearse() = false
	override method esInteresante() = super() or cantidadDeAtraccionesAVisitar == 5
}

class ExcursionALaCiudadTropical inherits ExcursionALaCiudad{
	override method diasDeActividad() = super() + 1
	override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viaje{
	
	var property kilometrosDeSenderoARecorrer
	var cantidadDeDiasDeSol
	
	override method diasDeActividad() = kilometrosDeSenderoARecorrer / 50
	override method requiereEsfuerzo() = kilometrosDeSenderoARecorrer > 80
	override method sirveParaBroncearse() =
	 cantidadDeDiasDeSol > 200 or (cantidadDeDiasDeSol.between(100,200) and kilometrosDeSenderoARecorrer > 120)
	 
	override method esInteresante() = super() and cantidadDeDiasDeSol > 140
}

class ClaseDeGimnasia inherits Actividad(idioma = ["Español"]){
	
	override method diasDeActividad() = 1
	override method requiereEsfuerzo() = true
	override method sirveParaBroncearse() = false
	override method esRecomendadaPara(unSocio) = unSocio.edad().between(20,30)
}

class TallerLiterario inherits Actividad{
	var property librosConLosQueTrabaja = []
	var property cantidadDeLibros
	
	override method requiereEsfuerzo() = librosConLosQueTrabaja.any({libro => libro.cantidadDePaginas()>500}) 
		or librosConLosQueTrabaja.all({libro => libro.nombreDelAutor()})
	
	override method sirveParaBroncearse() = false
	override method diasDeActividad() = cantidadDeLibros + 1 
	override method esRecomendadaPara(unSocio) = unSocio.idiomasQueHabla().size() > 1
}

class Libro{
	const property nombreDeLibro
	var property idioma
	var property cantidadDePaginas
	var property nombreDelAutor
}


