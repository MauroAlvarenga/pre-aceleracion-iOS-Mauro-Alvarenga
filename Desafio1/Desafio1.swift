// Desafio semana 1 - PreAceleracion iOS Alkemy

/* Consigna:
 
 1. Definir una tupla que describa una dirección, con campos como ciudad, partido, provincia, calle, pais, codigoPostal, etc. Siéntanse libres de colocar todos los campos que consideren relevantes. Usar un diccionario para la calle con los campos nombreDeCalle, numero, entrecalle1 y entrecalle2.
 2. Dentro de la dirección, definir algunos tipos de datos opcionales, entre ellos piso y departamento.
 3. Definir tres direcciones en constantes.
 4. Escribir una función que reciba una dirección y la imprima como un String bien formateado. Hacer uso de la interpolación.
 5. Escribir una función que reciba un Array de direcciones y devuelva un String que contenga "piso: \(piso) ; depto: \(departamento)", SOLO para las direcciones que tengan definidos tanto un piso como un departamento.
 */

// Puntos 1 y 2
typealias Direccion = (ciudad: String, partido: String, provincia: String, calle: [String:Any], pais: String, codigoPostal: Int, piso: Int?, departamento: Any?, datosAdicionales: String?)

// Punto 3
let direccionPersona1: Direccion = (
   ciudad: "Posadas",
   partido: "Capital",
   provincia: "Misiones",
   calle: ["nombreDeCalle": "Santa Catalina",
           "numero": 5041,
           "entreCalle1": "Bustamante",
           "entreCalle2": "Calle 104"
   ],
   pais: "Argentina",
   codigoPostal: 3301,
   piso: nil,
   departamento: nil,
   datosAdicionales: "Casa al fondo"
)

let direccionPersona2: Direccion = (
   ciudad: "Candelaria",
   partido: "Capital",
   provincia: "Misiones",
   calle: ["nombreDeCalle": "Mitre",
           "numero": 1047,
           "entreCalle1": "Sarmiento",
           "entreCalle2": "Bernardino Rivadavia"
   ],
   pais: "Argentina",
   codigoPostal: 3308,
   piso: 2,
   departamento: 205,
   datosAdicionales: "Escuela 29"
)

let direccionPersona3: Direccion = (
   ciudad: "Cupertino",
   partido: "condado de Santa Clara",
   provincia: "estado de California",
   calle: ["nombreDeCalle": "Infinite Loop",
           "numero": 1,
           "entreCalle1": "Apple Park Way",
           "entreCalle2": "ninguna otra"
   ],
   pais: "Estados Unidos",
   codigoPostal: 95014,
   piso: 4,
   departamento: "S1",
   datosAdicionales: nil
)

// Punto 4
func direccionFormateada(_ direccion: Direccion) -> String {
   return "La direccion completa es: \n" +
    "Calle \(direccion.calle["nombreDeCalle"]!) al \(direccion.calle["numero"]!), " +
    "entre \(direccion.calle["entreCalle1"]!) y \(direccion.calle["entreCalle2"]!).\n" +
    "\(direccion.ciudad) - \(direccion.partido) - \(direccion.provincia) - \(direccion.pais).\n" +
    "Codigo Postal: \(direccion.codigoPostal). \n" +
    "Datos adicionales: \(direccion.datosAdicionales ?? "No posee")" // Uso de nil coalescing para proveer un dato por defecto en caso de no existir datos adicionales.
    
}

print("-- Ejemplo de direccion formateada --")
print(direccionFormateada(direccionPersona1) + "\n")

// Punto 5 - Modifiqué el tipo de dato que devuelve a un array para devolver un String por cada Direccion.
func direccionPisoDepartamento(_ direcciones: [Direccion]) -> [String] {
    var arrayDirecciones: [String] = []
    for direccion in direcciones {
        if direccion.departamento != nil && direccion.piso != nil {
            let direccionConPisoDepto: String = "La direccion completa es: \n" +
            "Calle \(direccion.calle["nombreDeCalle"]!) al \(direccion.calle["numero"]!), " +
            "entre \(direccion.calle["entreCalle1"]!) y \(direccion.calle["entreCalle2"]!).\n" +
            "Piso \(direccion.piso!), departamento '\(direccion.departamento!)'." +
            "\(direccion.ciudad) - \(direccion.partido) - \(direccion.provincia) - \(direccion.pais).\n" +
            "Codigo Postal: \(direccion.codigoPostal). \n" +
            "Datos adicionales: \(direccion.datosAdicionales ?? "No posee")"
            arrayDirecciones.append(direccionConPisoDepto)
        }
    }
    return arrayDirecciones
}

let direccionesArray = [direccionPersona1, direccionPersona2, direccionPersona3]

let direccionesConPisoDepto = direccionPisoDepartamento(direccionesArray)

print("--Ejemplo de direcciones de Departamentos--")
for direccion in direccionesConPisoDepto {
    print(direccion + "\n")
}
