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
	
	method saldo(_saldo){
		saldo = _saldo
	}
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
	var costoPorDepositar = 20
	
	method saldo(_saldo){
		saldo = _saldo
	}
	method saldo(){
		return saldo
	}
	method depositar(montoADepositar){
		saldo += montoADepositar
		saldo -= self.costoPorDepositar()
	}
	method costoPorDepositar(_costoPorDepositar){
		costoPorDepositar = _costoPorDepositar
	}
	method costoPorDepositar(){
		return costoPorDepositar
	}
	method extraer(montoAExtraer){
		saldo -= montoAExtraer
	}
}
object cuentaCombinada {
	
	method saldoCombinado(){
		return cuentaCorriente.saldo() 
				+ cuentaConGastos.saldo()
	}
	method depositar(montoADepositar){
		cuentaConGastos.depositar(montoADepositar)
	}
	method extraer(montoAExtraer){
		return 	if (cuentaConGastos.saldo() > montoAExtraer) {
					cuentaConGastos.extraer(montoAExtraer)
				}
			   	else {
			   		cuentaCorriente.extraer(montoAExtraer)
				}
	}
}