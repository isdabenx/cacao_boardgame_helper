import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:isar/isar.dart';

part 'tile_model.g.dart';

@collection
class TileModel {
  Id id = Isar.autoIncrement;
  late String name;
  late String description;
  late String filenameImage;
  final boardgame = IsarLink<BoardgameModel>();
  final module = IsarLink<ModuleModel>();
}
