import 'package:clase05_06_2024/settings/api1_connection.dart';

class Joker {
  dynamic category;
  dynamic type;
  dynamic joke;

  Joker({
    this.category,
    this.type,
    this.joke,
  });

  factory Joker.fromDictionary(Map<String, dynamic> data) => Joker(
        category: data['category'],
        type: data['type'],
        joke: data['joke'],
      );

  Map<String, dynamic> toDictionary() => {
        'category': category,
        'type': type,
        'joke': joke,
      };

  static Future<List<Joker>> get() async {
    var response = await Api1Connection.get();
    if (response.isEmpty) {
      return List.empty();
    } else {
      return [Joker.fromDictionary(response)];
    }
  }
}
