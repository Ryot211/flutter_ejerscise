import 'package:clase05_06_2024/settings/api_connection.dart';

class Country {
  dynamic name;
  String? region;
  dynamic flag;
  int? population;

  Country({
    this.name,
    this.region,
    this.flag,
    this.population,
  });
  factory Country.fromDictionary(Map<String, dynamic> data) => Country(
        name: data['name'],
        region: data['region'],
        flag: data['flag'],
        population: data['population'],
      );
  Map<String, dynamic> toDictionary() => {
        'name': name,
        'region': region,
        'flag': flag,
        'population': population,
      };

  //funcion para consultar la conexion con el API
  static Future<List<Country>> get() async {
    var response = await ApiConnection.get(); // llamado a la funcion get
    if (response.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          response.length, (index) => Country.fromDictionary(response[index]));
    }
  }
}
