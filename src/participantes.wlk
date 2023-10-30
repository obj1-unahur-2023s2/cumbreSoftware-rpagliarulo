import paises.*

class Participante {
	const property pais
	const conocimientos= #{}
	const commits
	

	method esCape()
}

class Programador inherits Participante {
	
	override method esCape()= commits > 500
}

class Especialista inherits Participante {
	
	override method esCape()= conocimientos.size() > 2
}
