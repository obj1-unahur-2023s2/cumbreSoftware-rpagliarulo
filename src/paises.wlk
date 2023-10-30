class Pais {
	const paisesConLosQueTieneConflictos= #{}
	
	method registrarConflicto(unPais)= paisesConLosQueTieneConflictos.add(unPais) 
	method estaEnConflictoCon(unPais)= paisesConLosQueTieneConflictos.contains(unPais)
}
