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

  String get typeAsString {
    if (type == null) return '';
    switch (type) {
      case TileType.player:
        return 'Player';
      case TileType.market:
        return 'Market';
      case TileType.plantation:
        return 'Plantation';
      case TileType.goldMine:
        return 'Gold Mine';
      case TileType.water:
        return 'Water';
      case TileType.temple:
        return 'Temple';
      case TileType.sunWorshipingSite:
        return 'Sun-Worshiping Site';
      default:
        return '';
    }
  }

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
      id: json['id'] as Id,
      name: json['name'] as String,
      description: json['description'] as String,
      filenameImage: json['filenameImage'] as String,
      quantity: json['quantity'] as int,
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
      boardgameId: json['boardgame'] as int,
    );
  }

  TileModel copyWith({
    Id? id,
    String? name,
    String? description,
    String? filenameImage,
    int? quantity,
    TileType? type,
    TileColor? color,
    IsarLink<BoardgameModel>? boardgame,
    IsarLink<ModuleModel>? module,
    int? boardgameId,
  }) {
    final newModel = TileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      filenameImage: filenameImage ?? this.filenameImage,
      quantity: quantity ?? this.quantity,
      type: type ?? this.type,
      color: color ?? this.color,
      boardgameId: boardgameId ?? this.boardgameId,
    );
    newModel.boardgame.value = boardgame?.value ?? this.boardgame.value;
    newModel.module.value = module?.value ?? this.module.value;
    return newModel;
  }
}
