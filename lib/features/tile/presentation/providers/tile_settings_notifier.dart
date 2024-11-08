import 'package:cacao_boardgame_helper/features/tile/domain/entities/tile_settings_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileSettingsNotifier extends Notifier<TileSettingsEntity> {
  @override
  build() {
    return TileSettingsEntity();
  }

  void togglePlayerColorInBorder() {
    state = state.copyWith(playerColorInBorder: !state.playerColorInBorder);
  }

  void togglePlayerColorInCercle() {
    state = state.copyWith(playerColorInCercle: !state.playerColorInCercle);
  }

  void toggleBadgeTypeInImage() {
    state = state.copyWith(badgeTypeInImage: !state.badgeTypeInImage);
  }

  void toggleBadgeTypeInText() {
    state = state.copyWith(badgeTypeInText: !state.badgeTypeInText);
  }
}

final tileSettingsNotifier =
    NotifierProvider<TileSettingsNotifier, TileSettingsEntity>(
        () => TileSettingsNotifier());
