import UIKit

// -> un comentario en una linea
/*
 -> Este es un comentario en varias lineas
*/

// MARK: - TIPOS BASICOS

var nombre: String = "Pepe" // var -> variable mutable, se puede cambiar
let apellido: String = "Ramirez" // let -> variable inmutable, no se puede cambiar

nombre = "Felipe"
//apellido = "Ocampo" -> Aqui salta error porque es una variable let

let profesion = "iOS Developer" // -> No es necesario indicar que es String porque IOS lo detecta ya con las ""
print(profesion)

print("El Sr. \(nombre + " " + apellido), es \(profesion)")

var numeroA: Int = 4
var numeroB = 3.5 // -> Esta variable de aqui es un Double es decir numero con coma

var multiplicacion = Double(numeroA) * numeroB // -> Para que funcione hay que indicar que numeroA es Double(0.0) para que se puedan multiplicar los dos

typealias EnteroAndres = Int

var numeroC: EnteroAndres = 5

multiplicacion = multiplicacion + Double(numeroC) // -> Para que funcione hay que indicar que numeroC es Double(0.0) para que se puedan sumar los dos

var numeroD = 1, numeroE = 4, numeroF = 5 // -> Todos los numero son una variable Int
print(numeroD)

// MARK: - OPERADORES

var numeroG = 0 // -> Hay que poner espacio entre todo porque sino da error
numeroG = 2 * 5 + 7

numeroG += 1

print(numeroG)

numeroG -= 10

var sino: Bool = true

if sino {
	print("Correcto")
} else {
	print("Incorrecto")
}

if nombre.isEmpty || apellido.isEmpty {
	print("Coloca datos")
} else {
	print("Ya existen datos")
}

if numeroG >= 7 {
	print("Correcto")
} else {
	print("Incorrecto")
}

var resultado = numeroG != 0
	? numeroA / Int(numeroB)
	: 0
print(resultado)

// MARK: - STRING - CHARACTERS

var emptyString = ""
var anotherEmptyString = String()
var despedida = "Hola!"

emptyString.isEmpty
despedida.isEmpty
var variableStringMutable = "Andres"
variableStringMutable += "Felipe"
variableStringMutable += "Ocampo"
variableStringMutable += "Eljaiek"

for index in despedida {
	print(index)
}

let exclamacion: Character = "!"
despedida += String(exclamacion)

var categoriaCharacters: [Character] = ["C", "b", "r", "T"]

categoriaCharacters.append("G")

var catString = String(categoriaCharacters)
print(catString)

let animalesInusuales = "Koala _ ?, Ronoceronte ?, Finguino ?, DrummerdariusAlexusGregours ?"
print("Animales inusuales \(animalesInusuales.count) caracteres")

var bienvenidosASwift = "Hola"
bienvenidosASwift.insert("!", at: bienvenidosASwift.endIndex) // -> Esto lo que hace es poner al final la !
bienvenidosASwift.insert(contentsOf: "a vosotros", at: bienvenidosASwift.endIndex)

print(bienvenidosASwift)

// MARK: - Arrays (matrices -> Colecciones)

var iPhones = ["iPhone 8", "iPhone X", "iPhone 11", "iPhone 12"]
var iPads = ["iPad Air", "iPad Pro", "iPad Mini"]

var dispositivos = iPhones + iPads

dispositivos.append("Mac Book Pro") // -> Añade al final un nuevo dispositivo a la Array
dispositivos.insert("iWatch 24mm", at: 0) // -> Añade en la posicion 0 un nuevo dispositivo
dispositivos.remove(at: 5) // -> Elimina un dispositivo de la Array
print(dispositivos)

dispositivos.sort(by: >) // -> Ordena los dispositivos de mayor a menor

let iphone5 = dispositivos[2]

let lastPosition = dispositivos.last // -> Obtienes el ultimo dispositivo
let firstPosition = dispositivos.first // -> Obtienes el primer dispositivo

// MARK: - Diccionarios (matrices -> Colecciones)

var diccionariosVacios: [String: String] = [:] // -> Diccionarios de ahora
var otroDiccionario = Dictionary<String, Any>() // -> Diccionarios antiguos

var coche: [String: String] = ["marca": "Opel",
							   "modelo": "Karl Rocks",
							   "potencia":"75 caballos",
							   "matricula": "2056KZS"]

let marca: String? = coche["marca"] // -> Ponemos ? en String para que sea opcional

if coche["modelo"] != nil {
	print(coche["modelo"]!) // -> usamos ! para desempaquetar el coche
}

//variable temporal
if let modelo = coche["modelo"] { // -> Compruebo que coche no viene a nil y entonces imprimo el modelo
	print(modelo)
	print(marca ?? "") // -> ?? "" Esto es un super ternario de desempaquetados, si es nil lo rellena con una marca vacia ""
} else {
	
}

for (clave, valor) in coche {
	print("Clave: \(clave) y valor: \(valor)")
}

for clave in coche.keys {
	print(clave)
}

for value in coche.values {
	print(value)
}

// MARK: - Optionales (Optional binding)

var numeroEntero = 34
var numeroString = "3"

var sumaNumeroEnteroYString = numeroEntero + Int(numeroString)!

var nuevaSuma: String = String(sumaNumeroEnteroYString)

var nuevaSumaString: String = numeroString + String(numeroEntero)

var nombreAA: String? = "Andres"
nombreAA = "Felipe"

var nombreBB: String? = nil
var nombreModA: String!

if let nombreModAW = nombreModA {
	print("Mi nombre es \(nombreModAW)")
}

var xOptional: Int?
xOptional = 2
var nuevoValorOptional: String?
nuevoValorOptional = String(xOptional ?? 0)

var ySumatoria: Int = 20
var resultadoSumatoriaXY = nuevoValorOptional! + String(ySumatoria)

if let resultadoSumatoria = nuevoValorOptional {
	print(resultadoSumatoria)
}

// MARK: - Funciones

func miSerieFavorita() {
	print("perdidos")
}

miSerieFavorita()

func funcionRetornaString() -> String {
	"¡Hola Mundo!"
}

let varRetornoString = funcionRetornaString()
print(varRetornoString)

func miFuncionConAtributos(mensaje: String) {
	print(mensaje)
}

miFuncionConAtributos(mensaje: "Holaa")

func numerosSecuencia(a: Int, b: Int, c: Int) -> Int {
	return (a * b) + c
}

let numerosSecuenciales = numerosSecuencia(a: 2, b: 4, c: 1)
print(numerosSecuenciales)

func hola(nombrePersona: String) -> String {
	let saludo = "hola" + " " + nombrePersona + "!"
	return saludo
}

var saluda = hola(nombrePersona: "Andres")
print(saluda)

func holaDeNuevo(nombrePersona: String) -> String {
	let saludo = "hola" + " " + nombrePersona + "!"
	return saludo
}

func holaAmigos(nombrePersona: String, listoSaludar: Bool) -> String {
	if listoSaludar {
		return hola(nombrePersona: "Andres")
	} else {
		return holaDeNuevo(nombrePersona: "Felipe")
	}
	
}

print(holaAmigos(nombrePersona: "Andres", listoSaludar: true))

func mutacionParametros(a: Int, b: Int, multiply c: Int) -> Int {
	return (a * b) + c
}

mutacionParametros(a: 2, b: 3, multiply: 4)

var numeroPi = 3

func funcionInOut(numero: inout Int) { // inout lo que hace es que puedas manipular el Int
	numero += 3
}

funcionInOut(numero: &numeroPi) // la & se pone porque apuntamos a un puntero (inout)
print(numeroPi)
