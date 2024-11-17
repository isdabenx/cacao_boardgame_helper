import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/game_setup_state_entity.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/player_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameSetupNotifier extends Notifier<GameSetupStateEntity> {
  @override
  GameSetupStateEntity build() {
    return GameSetupStateEntity();
  }

  void addPlayer(String name, String color) {
    final player = PlayerEntity(name: name, color: color, isSelected: true);
    state = state.copyWith(players: [...state.players, player]);
  }

  void removePlayer(String name) {
    state = state.copyWith(
        players: state.players.where((p) => p.name != name).toList());
  }

  void updatePlayerSelection(String color, bool isSelected) {
    state = state.copyWith(
      players: state.players.map((p) {
        if (p.color == color) {
          return p.copyWith(isSelected: isSelected);
        }
        return p;
      }).toList(),
    );
  }

  void addExpansion(String expansion) {
    state = state.copyWith(expansions: [...state.expansions, expansion]);
  }

  void removeExpansion(String expansion) {
    state = state.copyWith(
        expansions: state.expansions.where((e) => e != expansion).toList());
  }

  void addModule(String module) {
    state = state.copyWith(modules: [...state.modules, module]);
  }

  void removeModule(String module) {
    state = state.copyWith(
        modules: state.modules.where((m) => m != module).toList());
  }
}

final gameSetupProvider =
    NotifierProvider<GameSetupNotifier, GameSetupStateEntity>(() {
  return GameSetupNotifier();
});
