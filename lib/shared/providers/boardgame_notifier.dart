import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:cacao_boardgame_helper/core/providers/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class BoardgameNotifier extends Notifier<List<BoardgameModel>> {
  Isar? _database;

  @override
  List<BoardgameModel> build() {
    return [];
  }

  Future<void> initialize() async {
    _database = await ref.watch(databaseProvider.future);
    await loadBoardgames();
  }

  Future<void> loadBoardgames() async {
    if (_database == null) {
      return;
    }
    final List<BoardgameModel> boardgames =
        await _database!.boardgameModels.where().findAll();
    state = boardgames;
  }

  BoardgameModel boardgameById(int id) {
    if (_database == null) {
      return BoardgameModel(
          description: 'Unknown', filenameImage: '', id: 0, name: 'Unknown');
    }
    final BoardgameModel boardgame = _database!.boardgameModels.getSync(id) ??
        BoardgameModel(
            description: 'Unknown', filenameImage: '', id: 0, name: 'Unknown');
    return boardgame;
  }
}

final boardgameNotifierProvider =
    NotifierProvider<BoardgameNotifier, List<BoardgameModel>>(
  () => BoardgameNotifier(),
);
