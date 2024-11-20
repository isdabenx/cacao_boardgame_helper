import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/game_setup_state_entity.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/player_entity.dart';
import 'package:cacao_boardgame_helper/shared/providers/boardgame_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameSetupNotifier extends Notifier<GameSetupStateEntity> {
  @override
  GameSetupStateEntity build() {
    final boardgame =
        ref.read(boardgameNotifierProvider.notifier).boardgameById(1);
    return GameSetupStateEntity(expansions: [boardgame]);
  }

  void addPlayer(String name, String color) {
    final player = PlayerEntity(name: name, color: color, isSelected: true);
    state = state.copyWith(players: [...state.players, player]);
  }

  void removePlayer(String color) {
    state = state.copyWith(
        players: state.players.where((p) => p.color != color).toList());
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

  void addExpansion(BoardgameModel expansion) {
    state = state.copyWith(expansions: [...state.expansions, expansion]);
  }

  void removeExpansion(BoardgameModel expansion) {
    state = state.copyWith(
      expansions: state.expansions.where((e) => e.id != expansion.id).toList(),
    );
  }

  void toggleExpansion(BoardgameModel expansion) {
    if (state.expansions.any((e) => e.id == expansion.id)) {
      removeExpansion(expansion);
    } else {
      addExpansion(expansion);
    }
  }

  void addModule(ModuleModel module) {
    state = state.copyWith(modules: [...state.modules, module]);
  }

  void removeModule(ModuleModel module) {
    state = state.copyWith(
      modules: state.modules.where((m) => m.id != module.id).toList(),
    );
  }

  void toggleModule(ModuleModel module) {
    if (state.modules.any((m) => m.id == module.id)) {
      removeModule(module);
    } else {
      addModule(module);
    }
  }

  void startGame() {
    final modules = state.modules
        .where((m) => state.expansions.any((e) => e.id == m.boardgameId))
        .toList();
    final players =
        state.players.where((p) => p.isSelected && p.name.isNotEmpty).toList();

    final playerColors = players.map((p) => p.color).toSet();
    final filteredColors =
        AppColors.colors.keys.where((color) => playerColors.contains(color));

    List<TileModel> tiles = filteredColors.expand((color) {
      return state.expansions.expand((boardgame) {
        return boardgame.tiles.where((t) =>
            t.color ==
            TileColor.values
                .firstWhere((c) => c.toString().split('.').last == color));
      });
    }).toList();

    if (players.length > 2) {
      tiles = tiles.map((tile) {
        if (tile.name == '1-1-1-1') {
          return tile.copyWith(quantity: tile.quantity - 1);
        }
        if (players.length > 3 && tile.name == '2-1-0-1') {
          return tile.copyWith(quantity: tile.quantity - 1);
        }
        return tile;
      }).toList();
    }

    state.expansions.where((e) => e.id == 1).forEach((e) {
      tiles.addAll(e.tiles.where((t) => t.color == null));
    });

    state = state.copyWith(players: players, modules: modules, tiles: tiles);
  }
}

final gameSetupProvider =
    NotifierProvider<GameSetupNotifier, GameSetupStateEntity>(() {
  return GameSetupNotifier();
});
