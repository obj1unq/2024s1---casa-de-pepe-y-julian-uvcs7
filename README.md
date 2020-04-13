# Casa de Pepe y Julián

Pepe y Julián viven juntos, y les gusta comprar cosas. 
De cada cosa nos interesa el precio, si es comida o no, y si es un electrodoméstico o no.

## Sobre las cosas que se compran
En este modelo reducido, vamos a considerar las siguientes cosas que podrían ser interesantes para comprar: una heladera que vale 20000 pesos, una cama que sale 8000, una tira de asado que sale 350 pesos, un paquete de fideos que sale 50 pesos, y una plancha que vale 1200 pesos. Por las dudas aclaramos: la cama no es un electrodoméstico, la plancha sí.

Implementar, además de los objetos que representan cada cosa, un objeto que represente a la casa, que entienda los siguientes mensajes:
- `comprar(cosa)`: registra que se ha comprado una cosa.
- `cantidadDeCosasCompradas()`: indica ... eso.
- `tieneComida()`: indica si compró algo que es comida al menos una vez.
- `vieneDeEquiparse()`: indica si la _última_ cosa que se compró es un electrodoméstico, o bien vale más de 5000 pesos.
- `esDerrochona()`: indica si el importe total de las cosas compradas es de 9000 pesos o más.
- `compraMasCara()`: retorna la cosa comprada de mayor valor.
- `electrodomésticosComprados()`: devuelve un objeto que contiene todas las cosas compradas que son electrodomésticos. 
- `malaEpoca()`: indica si todas las cosas compradas son comida.
- `queFaltaComprar(lista)`: recibe una lista de cosas y devuelve las cosas de esa lista que aún no se han comprado. <br>
  **Atención**: es una pregunta. No se pide que se compren. 
- `faltaComida()`: indica si se han comprado menos de 2 cosas que son comida.


## Más cosas
Agregar las siguientes cosas que pueden comprarse:
- un kilo de milanesas rebozadas: 260 pesos.
- una botella de salsa de tomates: 90 pesos.
- un microondas: 4200 pesos.
- un kilo de cebollas: 25 pesos.
- una compu: 500 dólares. Para saber el precio en pesos, multiplicar por la cotización del dólar. Agregar un objeto `dolar` al que se le pueda preguntar el `precioDeVenta()`, alcanza con que devuelva un valor fijo. 
<!-- Agregar también un `precioDeCompra()` que se va a usar más adelante. Se supone que el precio de compra es un poco menor al de venta, p.ej. si el de venta es 35, el de compra es 34. -->
- un "pack comida" que incluye un plato (que puede ser tira de asado, fideos o milanesas) y un aderezo (que puede ser la botella de salsa de tomates o el kilo de cebollas. Precio: la suma del precio de sus componentes.

Pregunta: para lograr que la casa pueda comprar estas cosas nuevas, ¿qué hubo que cambiar en la definición del objeto que representa la casa? Si hay que tocar poco, o nada, ¿qué concepto nos ayuda?


## Cuenta bancaria
Agreguemos al modelo objetos que representan diferentes _cuentas bancarias_. Estos objetos deben entender tres mensajes: `depositar(importe)`, `extraer(importe)`, y `saldo()`. 
Al objeto que representa la casa hay que agregarle un atributo, que es la cuenta que se va a usar para pagar los gastos que se hagan. Por lo tanto, al comprar una cosa, hay que también extraer de la cuenta el precio de la cosa comprada.     


Incluir tres cuentas:
1. una **cuenta corriente**, tiene un atributo que es el saldo, al depositar suma al saldo, al extraer resta.
1. una **cuenta con gastos**, también mantiene un saldo. Al depositar suma el importe indicado menos 20 pesos que son gastos de la operación. P.ej. si deposito 1000 pesos, el saldo aumenta en 980. Al extraer, si se extraen 1000 pesos o menos hay un cargo de 20 pesos, si se extrae más es el 2% del importe a extraer (o sea, `importe / 50`). Entonces, si se extraen 500 pesos, hay que restar 520 del saldo, y si se extraen 2000, hay que restar 2040 (2000 más 40 que es el 2% de gastos).
1. una **cuenta combinada** que tiene dos cuentas, una _primaria_ y una _secundaria_. Si se deposita, el importe pasa a la primaria. Si se extrae es así: si la cuenta primaria tiene saldo suficiente se extrae de esa, y si no de la secundaria (vale suponer que la secundaria siempre tiene saldo). El saldo de la combinada es la suma del saldo de las dos. <br>
P.ej. supongamos que configuramos la cuenta combinada así: la primaria es la cuenta corriente, la secundaria es la cuenta con gastos. Supongamos también que la cuenta corriente tiene 3000 pesos y la cuenta con gastos tiene 200000. Así las cosas:
	- El _saldo_ de la cuenta combinada es 203000 pesos.
	- Si se _depositan_ 1000 pesos en la cuenta combinada, van a la cuenta corriente (porque es la primaria), al depositarse este importe, su saldo pasa a 4000. 
	- Si se _extraen_ 500 pesos, salen de la cuenta corriente que es la primaria. Si se extraen 10000, salen de la cuenta con gastos, porque el saldo de la cuenta corriente no es suficiente.
	
Inlcuir las cuentas en los gastos de la casa:
Agregar en la casa los métodos `gastar(importe)`, que hace la extracción de la cuenta que esté usando, y `dineroDisponible()`, que es el saldo de la cuenta. 
Modificar el método `comprar(cosa)` para que además de lo que esté haciendo, registre el gasto por el precio de la cosa que se está comprando. P.ej. comprar la tira de asado implica gastar 350 pesos.

### Segunda etapa:
Modificar la **cuenta corriente** para que el saldo nunca pueda ser negativo, si el valor que se desea extraer mayor al disponible, entonces la extracción no se puede realizar, es decir, si tengo $500, y necesito extraer $600, entonces la extracción no se puede realizar.

Agregar el método `comprarLoQueFalta()`: Que recorre la lista de las cosas que faltan y las compra.


## Tests 
1. Realizar un test para verficar que si tengo $1000 y quiero sacar $900, lo puedo hacer.
1. Realizar un test con un saldo de $1000 e intentar sacar $1200.
1. Testear que si tengo $1000 de saldo, puedo comprar un tira de asado, tengo una cosa en la lista de cosas compradas y al saldo se le restó el precio de la tira de asado.
1. Testear que si tengo $1000 de saldo, no puedo comprar una plancha, por lo tanto la lista de cosas compradas queda vacío, y el el saldo no se modificó.








