import 'package:clase05_06_2024/settings/db_connection.dart';

class Subject{
  int? id;
  String name;
  String date;  
  String credits;
  String description;
  String teacher;

Subject ({
  this.id,
  required this.name,
  required this.date,
  required this.credits,
  required this.description,
  required this.teacher
  
});

factory Subject.fromDictionary(Map<String, dynamic>data )=> Subject(
id: data['id'],
name: data['nombre'],
date: data['fecha'],
credits: data['creditos'],
description: data['descripcion'],
teacher: data['profesor']
);

Map<String, dynamic> toDictionary()=> {
  'id': id,
  'nombre': name,
  'fecha': date,
  'creditos': credits,
  'descripcion': description,
  'profesor': teacher
  };
  static Future<List<Subject>>select() async {
    var data = await DbConnection.list('Materia');
    if (data.isEmpty){
      return List.empty();
    }else{
      return List.generate(
        data.length,
      (index)=>Subject.fromDictionary(data[index])
      );
      
    }
  }
}