import paises.*
import conocimientos.*
import cumbre.*

class Participante {
	const property pais
	const conocimientos= #{}
	const commits

	method esCape()
	method cumpleRequisitos()= conocimientos.contains(programacionBasica)
}

class Programador inherits Participante {
	
	override method esCape()= commits > 500
	override method cumpleRequisitos()= super() && commits >= cumbre.cantidadDeCommitsRequeridos()
}

class Especialista inherits Participante {
	
	override method esCape()= conocimientos.size() > 2
	override method cumpleRequisitos()= super() && commits >= cumbre.cantidadDeCommitsRequeridos() - 100 && conocimientos.contains(objetos)
}
