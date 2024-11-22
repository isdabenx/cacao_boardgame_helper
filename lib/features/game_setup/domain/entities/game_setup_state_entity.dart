import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/player_entity.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/preparation_entity.dart';

class GameSetupStateEntity {
  final List<PlayerEntity> players;
  final List<BoardgameModel> expansions;
  final List<ModuleModel> modules;
  final List<TileModel> tiles;
  final List<PreparationEntity> preparation;

  GameSetupStateEntity({
    this.players = const [],
    this.expansions = const [],
    this.modules = const [],
    this.tiles = const [],
    this.preparation = const [],
  });

  GameSetupStateEntity copyWith({
    List<PlayerEntity>? players,
    List<BoardgameModel>? expansions,
    List<ModuleModel>? modules,
    List<TileModel>? tiles,
    List<PreparationEntity>? preparation,
  }) {
    return GameSetupStateEntity(
      players: players ?? this.players,
      expansions: expansions ?? this.expansions,
      modules: modules ?? this.modules,
      tiles: tiles ?? this.tiles,
      preparation: preparation ?? this.preparation,
    );
  }
}
