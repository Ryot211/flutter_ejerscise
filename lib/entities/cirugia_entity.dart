import 'package:clase05_06_2024/settings/db_connection.dart';

class Cirugia {
  int? id;
  String tipo;
  String fecha;
  String duracion;
  String paciente;
  String doctor;

  Cirugia({
    this.id,
    required this.tipo,
    required this.fecha,
    required this.duracion,
    required this.paciente,
    required this.doctor,
  });
  factory Cirugia.fromDictionary(Map<String, dynamic> data) => Cirugia(
        id: data['id'],
        tipo: data['tipo'],
        fecha: data['fecha'],
        duracion: data['duracion'],
        paciente: data['paciente'],
        doctor: data['doctor'],
      );
  Map<String, dynamic> toDictionary() => {
        'id': id,
        'tipo': tipo,
        'fecha': fecha,
        'duracion': duracion,
        'paciente': paciente,
        'doctor': doctor,
      };

  static Future<List<Cirugia>> select() async {
    var data = await DbConnection.list('Cirugia');
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Cirugia.fromDictionary(data[index]));
    }
  }
}
