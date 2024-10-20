import 'dart:convert';

import 'package:http/http.dart' as http;

import 'astros_model.dart';

class FetchData {
  static Future<AstrosModel> getAstros() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/iqfareez/astros-api/refs/heads/master/db.json'));
    if (response.statusCode == 200) {
      return AstrosModel.fromJson(jsonDecode(response.body)["data"]);
    } else {
      throw Exception(
          'Failed to load astros. StatusCode ${response.statusCode}');
    }
  }
}
