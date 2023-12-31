import paises.*
import conocimientos.*
import participantes.*
import actividades.*


object cumbre {
	const paisesAuspiciantes= #{}
	const participantes= #{}
	const actividadesRealizadas= new List()
	var property commitsRequeridos= 300
	
	method esConflictivo(unPais)= paisesAuspiciantes.any({pais => pais.estaEnConflictoCon(unPais)})
	method registrarIngreso(unaPersona) {participantes.add(unaPersona) }
	method paisesDeLosParticipantes()= participantes.map({participante => participante.pais()}).asSet()
	method cantidadDeParticipantesDe(unPais)= participantes.count({participante => participante.pais() == unPais})
	method paisConMasParticipantes()= self.paisesDeLosParticipantes().max({pais => self.cantidadDeParticipantesDe(pais)})
	method participantesExtranjeros()= participantes.filter({participante => !self.esPaisAuspiciante(participante.pais())})
	method esRelevante()= participantes.all({participante => participante.esCape()})
	method registrarAuspiciante(unPais) {paisesAuspiciantes.add(unPais)}
	method esPaisAuspiciante(unPais)= paisesAuspiciantes.contains(unPais) 
	method tieneRestringidoElAcceso(unaPersona)= self.esConflictivo(unaPersona.pais()) or (self.cantidadDeParticipantesDe(unaPersona.pais()) > 2 && !self.esPaisAuspiciante(unaPersona.pais())) 
	method puedeIngresar(unParticipante)= unParticipante.cumpleRequisitos() && !self.tieneRestringidoElAcceso(unParticipante)
	method darIngreso(unParticipante) {if (self.puedeIngresar(unParticipante)) self.registrarIngreso(unParticipante) else self.error("El participante no puede ingresar")}
	method esSegura()= participantes.all({participante => self.puedeIngresar(participante)})
	method registarActividad(unaActividad) {actividadesRealizadas.add(unaActividad)}
	method participoEnActividad(unaActividad, unaPersona)= unaPersona.conocimientos().contains(unaActividad.tema())
	method consecuenciasParaParticipantes(actividad)= participantes.forEach({participante => if (self.participoEnActividad(actividad, participante)) participante.consecuenciaActividad(actividad)})
	method totalDeHorasDeActividades()= actividadesRealizadas.map({actividad => actividad.horas()}).sum()
}




