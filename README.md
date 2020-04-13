# Casa de Pepe y Julián

Pepe y Julián viven juntos, y nos pidieron que les ayudemos con un sistema para administrar los gastos de la casa.

## La casa
De la casa se conoce la cantidad de víveres que tiene (en porcentaje) y un monto (en pesos) necesario para reparaciones. Además se quiere saber:
- Si la casa _tiene víveres suficientes_: mayor al 40%
- Si _hay que hacer reparaciones_.
- Si la casa _está en orden_, que implica que no hay que hacer reparaciones y tiene víveres suficientes.

#### Implementar los objetos y métodos necesarios para obtener la información requerida y poder configurar los víveres tiene y reparaciones que necesita la casa, sabiendo que comienza con 50% de los víveres y sin necesidad de reparaciones.

> **Caso de Prueba**: Hacer que se rompa algo de 1000 pesos de la casa, aumentando el monto de reparación. Validar que la casa:
> - Tiene víveres suficientes
> - Hay que hacer reparaciones
> - No está en orden

## Cuentas bancarias
Pepe y Julián poseen varios tipos de cuentas bancarias, de las cuales pueden conocer su saldo y extraer y depositar dinero:

1. una **cuenta corriente**, al depositar suma el saldo, al extraer resta.
1. una **cuenta con gastos**, también mantiene un saldo y un costo por operación. Al depositar suma el importe indicado menos el costo por operación. P.ej. para una cuenta de 20 pesos de costo por operación, si deposito 1000 pesos, el saldo aumenta en 980. Al extraer resta el saldo normalmente.
1. una **cuenta combinada** que tiene dos cuentas, una _primaria_ y una _secundaria_. Si se deposita, el importe pasa a la primaria. Si se extrae es así: si la cuenta primaria tiene saldo suficiente se extrae de esa, y si no de la secundaria (vale suponer que la secundaria siempre tiene saldo). El saldo de la combinada es la suma del saldo de las dos. <br>
P.ej. supongamos que configuramos la cuenta combinada así: la primaria es la cuenta corriente, la secundaria es la cuenta con gastos. Supongamos también que la cuenta corriente tiene 3000 pesos y la cuenta con gastos tiene 200000. Así las cosas:
	- El _saldo_ de la cuenta combinada es 203000 pesos.
	- Si se _depositan_ 1000 pesos en la cuenta combinada, van a la cuenta corriente (porque es la primaria), al depositarse este importe, su saldo pasa a 4000. 
	- Si se _extraen_ 500 pesos, salen de la cuenta corriente que es la primaria. Si se extraen 10000, salen de la cuenta con gastos, porque el saldo de la cuenta corriente no es suficiente.

Ellos asignan una de esas cuentas para gestionar los gastos de la casa. Cada vez que se preduce un gasto en la casa, se extrae de la cuenta asignada el importe correspondiente.

#### Se pide poder generar un gasto por un importe determinado en la casa, y que eso se vea afectado en la cuenta elegida previamente.

## Manteniendo la casa
Cada cierto tiempo Pepe y Julián hacen un mantenimiento de la casa y los gastos que producen dependen de la estrategia de ahorro que hayan consensuado. Existen tres _estrategias de mantenimiento_:

1. **Mínimo e indispensable**: si la casa no tiene los víveres suficientes, compran lo necesaria para que alcance (o sea, llegar al 40%). El gasto de comprar víveres se calcula como `porcentaje a comprar * calidad`, siendo la calidad un valor determinado al elegir la estrategia. 

1. **Llenar stock**:
	- Si la casa está en orden, se llena de víveres al 100%, sino solamente aumenta un 40%, siempre con una calidad de `5`
	- Además, si el saldo en la cuenta alcanza para hacer todas las reparaciones _y sobran más de 1000 pesos_, se hacen, sino no.

#### Se pide poder hacer un mantenimiento a la casa, sufriendo los efectos según la estrategia de mantenimiento.


## Tests 
1. Realizar un test para verficar que si tengo $1000 y quiero sacar $900, lo puedo hacer.
1. Realizar un test con un saldo de $1000 e intentar sacar $1200.
1. Testear que si tengo $1000 de saldo, puedo comprar un tira de asado, tengo una cosa en la lista de cosas compradas y al saldo se le restó el precio de la tira de asado.
1. Testear que si tengo $1000 de saldo, no puedo comprar una plancha, por lo tanto la lista de cosas compradas queda vacío, y el el saldo no se modificó.


