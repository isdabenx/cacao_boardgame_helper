import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:isar/isar.dart';

part 'boardgame_model.g.dart';

@collection
class BoardgameModel {
  final Id id;
  final String name;
  final String description;
  final String filenameImage;
  final require = IsarLink<BoardgameModel>();

  @Backlink(to: 'boardgame')
  final modules = IsarLinks<ModuleModel>();

  @Backlink(to: 'boardgame')
  final tiles = IsarLinks<TileModel>();

  BoardgameModel({
    required this.id,
    required this.name,
    required this.description,
    required this.filenameImage,
  });

  factory BoardgameModel.fromJson(Map<String, dynamic> json) {
    return BoardgameModel(
      id: json['id'] as Id,
      name: json['name'] as String,
      description: json['description'] as String,
      filenameImage: json['filenameImage'] as String,
    );
  }

  BoardgameModel copyWith({
    Id? id,
    String? name,
    String? description,
    String? filenameImage,
    IsarLink<BoardgameModel>? require,
  }) {
    final newModel = BoardgameModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      filenameImage: filenameImage ?? this.filenameImage,
    );
    newModel.require.value = require?.value ?? this.require.value;
    return newModel;
  }
}
