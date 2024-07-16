import 'package:clase05_06_2024/settings/db_connection.dart';

class Course {
  int? id ;
  String nombre;
  String description;
  String credits ;
  String ubication ;
  String encargado;

  Course ({
    this.id,
    required this.nombre,
    required this.description, 
    required this.credits,
    required this.ubication, 
    required this.encargado
  });

  factory Course.fromDictionary(Map<String, dynamic> data )=> Course(
    id: data['id'],
    nombre: data['nombre'], 
    description: data['description'], 
    credits: data['credits'], 
    ubication: data['ubicacion'],
    encargado: data['encargado']);
  Map<String, dynamic>toDictionary ()=>{
      'id' : id,
      'nombre': nombre,
      'description': description,
      'credits': credits,
      'ubicacion': ubication,
      'encargado': encargado
    };
    static Future<List<Course>>select() async{
      var data =await DbConnection.list('Curso');
      if(data.isEmpty){
        return List.empty();
      }else{
        return List.generate(
          data.length, (index) => Course.fromDictionary(data[index]));
      }
    }
}