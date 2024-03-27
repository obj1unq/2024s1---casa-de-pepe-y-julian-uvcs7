// CASA
object casa {
	
	var porcentajeViveres = 50
	var montoDeReparacion = 0
	
	method porcentajeViveres(){
		return porcentajeViveres
	}
	method porcentajeViveres(_porcentajeViveres){
		porcentajeViveres = _porcentajeViveres
	}
	method montoDeReparacion(){
		return montoDeReparacion
	}
	method montoDeReparacion(_montoDeReparacion){
		montoDeReparacion = _montoDeReparacion
	}
	method viveresSuficientes(){
		return self.porcentajeViveres() > 40
	}
	method hayQueHacerReparaciones(){
		return montoDeReparacion > 0
	}
	method casaEnOrden(){
		return self.viveresSuficientes() && not self.hayQueHacerReparaciones()
	}
}
// CUENTAS BANCARIAS
object cuentaCorriente {
	
	var saldo = 0
	
	method saldo(){
		return saldo
	}
	method depositar(montoADepositar){
		saldo += montoADepositar
	}
	method extraer(montoAExtraer){
		saldo -= montoAExtraer
	}
}
object cuentaConGastos {
	
	var saldo = 0
	
	method saldo(){
		return saldo
	}
	method depositar(montoADepositar){
		saldo += montoADepositar
		saldo -= self.costoPorDepositar()
	}
	method costoPorDepositar(){
		return 20
	}
	method extraer(montoAExtraer){
		saldo -= montoAExtraer
	}
}