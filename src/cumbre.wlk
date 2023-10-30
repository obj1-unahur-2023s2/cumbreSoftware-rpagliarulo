import paises.*
import conocimientos.*
import participantes.*


object cumbre {
	const paisesAuspiciantes= #{}
	const conocimientos= #{}
	const participantes= #{}
	
	method esConflictivo(unPais)= paisesAuspiciantes.any({pais => pais.estaEnConflictoCon(unPais)})
	method registrarIngreso(unaPersona) {participantes.add(unaPersona)}
	method paisesDeLosParticipantes()= participantes.map({participante => participante.pais()}).asSet()
	method cantidadDeParticipantesDe(unPais)= participantes.count({participante => participante.pais() == unPais})
	method paisConMasParticipantes()= self.paisesDeLosParticipantes().max({pais => self.cantidadDeParticipantesDe(pais)})
	method participantesExtranjeros()= participantes.filter({participante => !self.esPaisAuspiciante(participante.pais())})
	method esRelevante()= participantes.all({participante => participante.esCape()})
	method registrarAuspiciante(unPais) {paisesAuspiciantes.add(unPais)}
	method esPaisAuspiciante(unPais)= paisesAuspiciantes.contains(unPais) 
}

