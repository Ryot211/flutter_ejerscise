import 'package:clase05_06_2024/settings/db_connection.dart';

class Shop{
  int? id;
  String  nombre;
  String ubicacion;
  String tipo_ropa;
  String horario;
  String precio_promedio;
  
Shop({
    this.id,
    required this.nombre,
    required this.ubicacion,
    required this.tipo_ropa,
    required this.horario,
    required this.precio_promedio
});
  factory Shop.fromDictionary(Map<String,dynamic>data) => Shop(
    id: data['id'],
    nombre:data['nombre'],
    ubicacion:data['ubicacion'],
    tipo_ropa:data['tipo_ropa'],
    horario:data['horario'],
    precio_promedio:data['precio_promedio']
  );
  Map<String, dynamic> toDictionary()=>{
    'id':id,
    'nombre':nombre,
    'ubicacion':ubicacion,
    'tipo_ropa':tipo_ropa,
    'horario':horario,
    'precio_promedio':precio_promedio
  };
  static Future<List<Shop>>select() async{
    var data =await DbConnection.list('Tienda_ropa');
    if(data.isEmpty){
      return List.empty();
    }else{
      return List.generate(
        data.length, 
        (index)=>Shop.fromDictionary(data[index])
        );
    }
  }
}