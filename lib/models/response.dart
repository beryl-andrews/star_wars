import 'package:starwars/models/character.dart';

class ResponseModel {
  int? count;
  List<CharacterModel>? results;

  ResponseModel({this.count, this.results});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <CharacterModel>[];
      json['results'].forEach((v) {
        results!.add(CharacterModel.fromJson(v));
      });
    }
  }
}
