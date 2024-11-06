import 'package:isar/isar.dart';

part 'boardgame_model.g.dart';

@collection
class BoardgameModel {
  Id id = Isar.autoIncrement;
  late String name;
  late String description;
  late String filenameImage;
  final require = IsarLink<BoardgameModel>();
}
