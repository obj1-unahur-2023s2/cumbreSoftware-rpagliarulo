import paises.*
import conocimientos.*
import cumbre.*
import empresas.*
import actividades.*

class Participante {
	const property pais
	const conocimientos= #{}
	var commits

	method esCape()
	method cumpleRequisitos()= conocimientos.contains(programacionBasica)
	method consecuenciaActividad(unaActividad){conocimientos.add(unaActividad.tema()) commits += unaActividad.horas() * unaActividad.commitsPorHora()}  
}

class Programador inherits Participante {
	var horasDeCapacitacion= 100
		
	override method esCape()= commits > 500
	override method cumpleRequisitos()= super() && commits >= cumbre.commitsRequeridos()
	override method consecuenciaActividad(unaActividad) {super(unaActividad) horasDeCapacitacion += unaActividad.horas() 
	}
	
}

class Especialista inherits Participante {
	
	override method esCape()= conocimientos.size() > 2
	override method cumpleRequisitos()= super() && commits >= cumbre.commitsRequeridos() - 100 && conocimientos.contains(objetos)
}

class Gerente inherits Participante {
	const empresa
	
	override method esCape()= empresa.esMultinacional()
	override method cumpleRequisitos()= super() && conocimientos.contains(manejoDeGrupos)
}
