import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:people_in_space/Networking/astros_model.dart';
import 'package:people_in_space/Networking/bing_search_model.dart';
import 'package:people_in_space/SECRETS.dart';

class FetchData {
  static Future<AstrosModel> getAstros() async {
    final response =
        await http.get(Uri.parse('http://api.open-notify.org/astros.json'));
    if (response.statusCode == 200) {
      return AstrosModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load astros. StatusCode ${response.statusCode}');
    }
  }

  static Future<BingImageResponse> getAstrosImage() async {
    final response = await http.get(
        Uri.https(
          'api.bing.microsoft.com',
          '/v7.0/images/search',
          {'q': 'meow', 'count': '5'},
        ),
        headers: {'Ocp-Apim-Subscription-Key': key1});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return BingImageResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(
          'Failed to load images. StatusCode ${response.statusCode}');
    }
  }
}
