import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiConnection {
  static String url = 'https://restcountries.com/v3.1/all';

  static Future<List<Map<String, dynamic>>> get() async {
    try {
      var uri = Uri.parse(url); // convertir string en uri
      var response = await http.get(uri).timeout(Duration(seconds: 50));
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        // si da un codigo diferente se asume error
        return List.empty();
      }
    } catch (e) {
      // si accede a un error
      print(e); //logea el error
      return List.empty(); //retorna una lista
    }
  }
}
