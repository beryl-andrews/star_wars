import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starwars/models/character.dart';
import 'package:starwars/models/response.dart';

class Repository {
  Future<ResponseModel> get(int page) async {
    String endpoint = 'https://swapi.dev/api/people/?page=' + page.toString();
    http.Response response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      ResponseModel resp = ResponseModel();
      final List res = jsonDecode(response.body)['results'];
      resp.results = res.map((e) => CharacterModel.fromJson(e)).toList();
      resp.count = jsonDecode(response.body)['count'];
      return resp;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
