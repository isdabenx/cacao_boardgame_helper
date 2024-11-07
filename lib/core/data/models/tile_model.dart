import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:isar/isar.dart';

part 'tile_model.g.dart';

enum TileType {
  player,
  market,
  plantation,
  goldMine,
  water,
  temple,
  sunWorshipingSite,
}

enum TileColor {
  red,
  purple,
  white,
  yellow,
}

@collection
class TileModel {
  final Id id;
  final String name;
  final String description;
  final String filenameImage;
  final boardgame = IsarLink<BoardgameModel>();
  final module = IsarLink<ModuleModel>();
  final int quantity;

  @Enumerated(EnumType.name)
  TileType? type;

  @Enumerated(EnumType.name)
  TileColor? color;

  @ignore
  int? boardgameId;

  TileModel({
    required this.id,
    required this.name,
    required this.description,
    required this.filenameImage,
    required this.quantity,
    this.type,
    this.color,
    this.boardgameId,
  });

  factory TileModel.fromJson(Map<String, dynamic> json) {
    return TileModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      filenameImage: json['filenameImage'],
      quantity: json['quantity'],
      type: json['type'] != null
          ? TileType.values.firstWhere(
              (type) => type.toString() == 'TileType.${json['type']}',
            )
          : null,
      color: json['color'] != null
          ? TileColor.values.firstWhere(
              (color) => color.toString() == 'TileColor.${json['color']}',
            )
          : null,
      boardgameId: json['boardgame'],
    );
  }
}
