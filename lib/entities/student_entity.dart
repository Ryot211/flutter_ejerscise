import 'package:clase05_06_2024/settings/db_connection.dart';

class Student {
  // atributos debe ser igual a los de la base de datos
  int? id;
  String name;
  String lastName;

  Student(
      { // crear el contructos
      this.id, // parametro id es opcional
      required this.name, // parametro name es requerido
      required this.lastName // parametro lastName es requerido
      });
  // crear funcion para parse de diccionaraio a clase (Student)
  // esto se utilizar al momento de seleccionar los datos
  // acepta como parametro el tipo de datos de diccionario(Map)
  factory Student.fromDictionary(Map<String, dynamic> data) => Student(
      id: data['id'], // extraer datos id de data
      name: data['name'], // extraer name de data
      lastName: data['last_name'] // extraer el last_name de data
      );
  // crear funcion para parse de clase a diccionario
  // esto se utiliza al momento de registrar datos (insert, update)
  // no acepta nada como argumento
  Map<String, dynamic> toDictionary() => {
        'id': id, // asignar el valor del id al diccionario
        'name': name, // asignar el valor de name al diccionario
        'last_name': lastName // asignar el valor de lastname a diccionario
      };
  static Future<List<Student>> select() async {
    var data = await DbConnection.list("Estudiantes");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Student.fromDictionary(data[index]));
    }
  }
}
