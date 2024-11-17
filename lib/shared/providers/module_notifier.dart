import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:cacao_boardgame_helper/core/providers/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class ModuleNotifier extends Notifier<List<ModuleModel>> {
  Isar? _database;

  @override
  List<ModuleModel> build() {
    _initialize();
    return [];
  }

  Future<void> _initialize() async {
    _database = await ref.watch(databaseProvider.future);
    loadModules();
  }

  Future<void> loadModules() async {
    if (_database == null) {
      return;
    }
    final List<ModuleModel> modules =
        await _database!.moduleModels.where().findAll();
    state = modules;
  }

  ModuleModel moduleById(int id) {
    if (_database == null) {
      return ModuleModel(id: 0, name: 'Unknown', description: 'Unknown');
    }
    final ModuleModel module = _database!.moduleModels.getSync(id) ??
        ModuleModel(id: 0, name: 'Unknown', description: 'Unknown');
    return module;
  }
}

final moduleNotifierProvider =
    NotifierProvider<ModuleNotifier, List<ModuleModel>>(
  () => ModuleNotifier(),
);
