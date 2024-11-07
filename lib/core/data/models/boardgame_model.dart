import 'package:isar/isar.dart';

part 'boardgame_model.g.dart';

@collection
class BoardgameModel {
  final Id id;
  final String name;
  final String description;
  final String filenameImage;
  final require = IsarLink<BoardgameModel>();

  BoardgameModel({
    required this.id,
    required this.name,
    required this.description,
    required this.filenameImage,
  });

  factory BoardgameModel.fromJson(Map<String, dynamic> json) {
    return BoardgameModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      filenameImage: json['filenameImage'],
    );
  }
}
