import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:isar/isar.dart';

part 'module_model.g.dart';

@collection
class ModuleModel {
  Id id;
  late String name;
  late String description;
  final boardgame = IsarLink<BoardgameModel>();

  @ignore
  int? boardgameId;

  ModuleModel({
    required this.id,
    required this.name,
    required this.description,
    this.boardgameId,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      boardgameId: json['boardgame'],
    );
  }

  ModuleModel copyWith({
    String? name,
    String? description,
    IsarLink<BoardgameModel>? boardgame,
  }) {
    final newModel = ModuleModel(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
    newModel.boardgame.value = boardgame?.value ?? this.boardgame.value;
    return newModel;
  }
}
