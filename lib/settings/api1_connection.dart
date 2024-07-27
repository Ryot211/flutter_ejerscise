import 'package:http/http.dart' as http;
import 'dart:convert';

class Api1Connection {
  static String url = 'https://v2.jokeapi.dev/joke/Any?lang=es';

  static Future<Map<String, dynamic>> get() async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri).timeout(Duration(seconds: 50));
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        return {};
      }
    } catch (e) {
      print(e);
      return {};
    }
  }
}
