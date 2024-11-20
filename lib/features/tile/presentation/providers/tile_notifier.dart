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
    loadTiles();
  }

  void loadTiles() {
    if (_database == null) {
      return;
    }
    final List<TileModel> tiles = _database!.tileModels.where().findAllSync();
    state = tiles;
  }
}

final tileNotifierProvider =
    NotifierProvider<TileNotifier, List<TileModel>>(() => TileNotifier());
