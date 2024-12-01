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
    final List<dynamic> boardgamesData =
        json.decode(boardgamesJson) as List<dynamic>;
    final List<BoardgameModel> boardgames = boardgamesData
        .map((boardgameData) =>
            BoardgameModel.fromJson(boardgameData as Map<String, dynamic>))
        .toList();

    await _isar.writeTxn(() async {
      await _isar.boardgameModels.putAll(boardgames);
    });

    final String modulesJson = await rootBundle.loadString(Assets.modulesJson);
    final List<dynamic> modulesData = json.decode(modulesJson) as List<dynamic>;
    final List<ModuleModel> modules = modulesData
        .map((moduleData) =>
            ModuleModel.fromJson(moduleData as Map<String, dynamic>))
        .toList();

    await _isar.writeTxn(() async {
      for (final module in modules) {
        if (module.boardgameId != null) {
          final boardgame =
              await _isar.boardgameModels.get(module.boardgameId!);
          module.boardgame.value = boardgame!;
        }
        await _isar.moduleModels.put(module);
        await module.boardgame.save();
      }
    });

    final String tilesJson = await rootBundle.loadString(Assets.tilesJson);
    final List<dynamic> tilesData = json.decode(tilesJson) as List<dynamic>;
    final List<TileModel> tiles = tilesData
        .map((tileData) => TileModel.fromJson(tileData as Map<String, dynamic>))
        .toList();

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
