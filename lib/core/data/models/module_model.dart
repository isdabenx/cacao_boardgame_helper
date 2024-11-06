import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:isar/isar.dart';

part 'module_model.g.dart';

@collection
class ModuleModel {
  Id id = Isar.autoIncrement;
  late String name;
  late String description;
  late String filenameImage;
  final boardgame = IsarLink<BoardgameModel>();
}
