import 'dart:convert';

import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/features/splash/domain/repositories/initialization_repository.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class InitializationRepositoryImpl implements InitializationRepository {
  late final Isar _isar;

  @override
  Future<void> initialize() async {
    await _initializeDatabase();
    await _poblateDatabase();
    // await Future.delayed(Duration(seconds: 3));
  }

  @override
  Isar getDatabase() {
    return _isar;
  }

  Future<void> _initializeDatabase() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [BoardgameModelSchema, ModuleModelSchema, TileModelSchema],
      directory: appDirectory.path,
    );
  }

  Future<void> _poblateDatabase() async {
    final String boardgamesJson =
        await rootBundle.loadString(Assets.boardgamesJson);
    final List<dynamic> boardgamesData = json.decode(boardgamesJson);
    final List<BoardgameModel> boardgames = boardgamesData
        .map((boardgameData) => BoardgameModel.fromJson(boardgameData))
        .toList();

    await _isar.writeTxn(() async {
      await _isar.boardgameModels.putAll(boardgames);
    });

    final String tilesJson = await rootBundle.loadString(Assets.tilesJson);
    final List<dynamic> tilesData = json.decode(tilesJson);
    final List<TileModel> tiles =
        tilesData.map((tileData) => TileModel.fromJson(tileData)).toList();

    await _isar.writeTxn(() async {
      for (final tile in tiles) {
        if (tile.boardgameId != null) {
          final boardgame = await _isar.boardgameModels.get(tile.boardgameId!);
          tile.boardgame.value = boardgame!;
        }
        await _isar.tileModels.put(tile);
        await tile.boardgame.save();
      }
    });
  }
}
