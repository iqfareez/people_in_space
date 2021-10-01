import 'dart:convert';
import 'package:http/http.dart' as http;
import 'astros_model.dart';

class FetchData {
  static Future<AstrosModel> getAstros() async {
    final response =
        await http.get(Uri.parse('https://astros-api.herokuapp.com/data'));
    if (response.statusCode == 200) {
      return AstrosModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load astros. StatusCode ${response.statusCode}');
    }
  }
}
