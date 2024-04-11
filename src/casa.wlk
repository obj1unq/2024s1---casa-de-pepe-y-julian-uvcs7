// CASAS
object casaDePepeYJulian {
	
	var porcentajeViveres = 50
	var montoDeReparaciones = 0
	var estrategiaDeAhorro = minimoEIndispensable
	
	method porcentajeViveres(){
		return porcentajeViveres
	}
	method porcentajeViveres(_porcentajeViveres){
		porcentajeViveres = _porcentajeViveres
	}
	method aumentoPorcentajeViveres(porcentajeAAumentar){
		porcentajeViveres += porcentajeAAumentar
	}
	
	method montoDeReparaciones(){
		return montoDeReparaciones
	}
	
	method montoDeReparaciones(_montoDeReparaciones){
		montoDeReparaciones = _montoDeReparaciones
	}
	
	method viveresSuficientes(){
		return porcentajeViveres > 40
	}
	
	method hayQueHacerReparaciones(){
		return montoDeReparaciones > 0
	}
	
	method casaEnOrden(){
		return self.viveresSuficientes() 
			   && not self.hayQueHacerReparaciones()
	}
	
	method estrategiaDeAhorro(_estrategiaDeAhorro){
		estrategiaDeAhorro = _estrategiaDeAhorro
	}
	
	method hacerMantenimiento(){
		estrategiaDeAhorro.comprarViveres(self)
		estrategiaDeAhorro.siAlcanzaHacerReparaciones(self)
	}
}

// ESTRATEGIAS DE AHORRO

object minimoEIndispensable {
	
	var calidad = 5
	
	method comprarViveres(casa){
		if (not casa.viveresSuficientes()){
					self.porcentajeAComprar(casa) * calidad
		} else {
			
		}
	}
	
	method porcentajeAComprar(casa){
		return (40 - casa.porcentajeViveres())
	}
	
	method calidad(_calidad){
		calidad = _calidad	
	}
	method siAlcanzaHacerReparaciones(casa){
		
	}
}

object full {
	
	const calidad = 5
	
	//FALTAN SUBTAREAS
	method comprarViveres(casa){
		if (casa.casaEnOrden()){
			casa.aumentoPorcentajeViveres(100 - casa.porcentajeViveres())
		} else {
			casa.aumentoPorcentajeViveres(40)
			cuentaCombinada.extraer(40 * calidad)
		}
	}
	
	method porcentajeAComprar(casa){
		return (40 - casa.porcentajeViveres())
	}
	//FALTAN SUBTAREAS
	method siAlcanzaHacerReparaciones(casa){
		if (cuentaCombinada.saldoCombinado() > 1000 + casa.montoDeReparaciones()
					&& casa.hayQueHacerReparaciones()) {
			cuentaCombinada.extraer(casa.montoDeReparaciones())
			casa.montoDeReparaciones(0) 
		} else {
		}
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
		saldo -= costoPorDepositar
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
	
	var cuentaPrimaria = cuentaCorriente
	var cuentaSecundaria = cuentaConGastos
	
	method cuentaPrimaria (_cuentaPrimaria) {
		cuentaPrimaria = _cuentaPrimaria
	}
	
	method cuentaSecundaria (_cuentaSecundaria) {
		cuentaSecundaria = _cuentaSecundaria
	}
	
	method saldoCombinado(){
		return cuentaPrimaria.saldo() 
				+ cuentaSecundaria.saldo()
	}
	
	method depositar(montoADepositar){
		cuentaSecundaria.depositar(montoADepositar)
	}
	
	method extraer(montoAExtraer){
		return if (cuentaSecundaria.saldo() > montoAExtraer) {
			cuentaSecundaria.extraer(montoAExtraer)
		}
		else {
			cuentaPrimaria.extraer(montoAExtraer)
		}
	}
}