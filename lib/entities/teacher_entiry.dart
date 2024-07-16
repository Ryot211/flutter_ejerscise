import 'package:clase05_06_2024/settings/db_connection.dart';

class Teacher {
  int? id;
  String name;
  String lastName;
  String deparment;
  String email;
  int telefono;

   Teacher({
    this.id,
    required this.name,
    required this.lastName,
    required this.deparment,
    required this.email,
    required this.telefono
  });
factory Teacher.fromDictionary(Map<String, dynamic> data) => Teacher(
  id: data['id'],
  name: data['name'],
  lastName: data['last_name'],
  deparment: data['department'],
  email: data['email'],
  telefono: data['telefono'],

);
Map<String, dynamic> toDictionary()=> {
  'id': id,
  'name': name,
  'last_name': lastName,
  'department': deparment,
  'email': email,
  'telefono': telefono

};

static Future<List<Teacher>>select() async {
  var data = await DbConnection.list('Profesor');
  if (data.isEmpty){
    return List.empty();
  }else{
    return List.generate(
      data.length, 
      (index) =>Teacher.fromDictionary(data[index]));
  }
}

}