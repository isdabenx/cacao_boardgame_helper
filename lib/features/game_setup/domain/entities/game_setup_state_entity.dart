import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/player_entity.dart';

class GameSetupStateEntity {
  final List<PlayerEntity> players;
  final List<String> expansions;
  final List<String> modules;

  GameSetupStateEntity({
    this.players = const [],
    this.expansions = const [],
    this.modules = const [],
  });

  GameSetupStateEntity copyWith({
    List<PlayerEntity>? players,
    List<String>? expansions,
    List<String>? modules,
  }) {
    return GameSetupStateEntity(
      players: players ?? this.players,
      expansions: expansions ?? this.expansions,
      modules: modules ?? this.modules,
    );
  }
}
