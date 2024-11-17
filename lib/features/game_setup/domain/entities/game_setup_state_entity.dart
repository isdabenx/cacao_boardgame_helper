import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/player_entity.dart';

class GameSetupStateEntity {
  final List<PlayerEntity> players;
  final List<BoardgameModel> expansions;
  final List<ModuleModel> modules;

  GameSetupStateEntity({
    this.players = const [],
    this.expansions = const [],
    this.modules = const [],
  });

  GameSetupStateEntity copyWith({
    List<PlayerEntity>? players,
    List<BoardgameModel>? expansions,
    List<ModuleModel>? modules,
  }) {
    return GameSetupStateEntity(
      players: players ?? this.players,
      expansions: expansions ?? this.expansions,
      modules: modules ?? this.modules,
    );
  }
}
