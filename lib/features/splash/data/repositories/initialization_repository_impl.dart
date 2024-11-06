import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/features/splash/domain/repositories/initialization_repository.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class InitializationRepositoryImpl implements InitializationRepository {
  late final Isar _isar;

  @override
  Future<void> initialize() async {
    await _initializeDatabase();
    // await Future.delayed(Duration(seconds: 12));
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
}
