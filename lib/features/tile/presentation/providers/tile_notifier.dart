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

  Future<void> loadTiles() async {
    if (_database == null) {
      return;
    }
    final List<TileModel> tiles = await _database!.tileModels.where().findAll();
    state = tiles;
  }

  Future<void> addTile(TileModel tile) async {
    if (_database == null) {
      return;
    }
    await _database!.writeTxn(() async {
      await _database!.tileModels.put(tile);
    });
    state = [...state, tile];
  }
}

final tileNotifierProvider =
    NotifierProvider<TileNotifier, List<TileModel>>(() => TileNotifier());
