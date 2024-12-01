import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/core/providers/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class TileNotifier extends Notifier<List<TileModel>> {
  Isar? _database;

  @override
  List<TileModel> build() {
    _initialize();
    return [];
  }

  Future<void> _initialize() async {
    _database = await ref.watch(databaseProvider.future);
  }

  void loadTiles() {
    if (_database == null) {
      return;
    }
    final List<TileModel> tiles = _database!.tileModels.where().findAllSync();
    state = tiles;
  }

  void filterByIds(List<Id> idsList) {
    if (_database == null) {
      return;
    }
    final List<TileModel> tiles = _database!.tileModels
        .filter()
        .anyOf<Id, dynamic>(idsList, (t, id) => t.idEqualTo(id))
        .findAllSync();
    state = tiles;
  }

  void pushTiles(List<TileModel> filteredTiles) {
    state = filteredTiles;
  }
}

final tileNotifierProvider =
    NotifierProvider<TileNotifier, List<TileModel>>(() => TileNotifier());
