import 'package:cacao_boardgame_helper/config/constants/tile_settings.dart';
import 'package:cacao_boardgame_helper/features/tile/domain/entities/tile_settings_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TileSettingsNotifier extends Notifier<TileSettingsEntity> {
  @override
  build() {
    _loadSettings();
    return TileSettingsEntity();
  }

  void togglePlayerColorInBorder() {
    state = state.copyWith(playerColorInBorder: !state.playerColorInBorder);
    _saveSettings();
  }

  void togglePlayerColorInCercle() {
    state = state.copyWith(playerColorInCercle: !state.playerColorInCercle);
    _saveSettings();
  }

  void toggleBadgeTypeInImage() {
    state = state.copyWith(badgeTypeInImage: !state.badgeTypeInImage);
    _saveSettings();
  }

  void toggleBadgeTypeInText() {
    state = state.copyWith(badgeTypeInText: !state.badgeTypeInText);
    _saveSettings();
  }

  void toggleBoardgameInTitle() {
    state = state.copyWith(boardgameInTitle: !state.boardgameInTitle);
    _saveSettings();
  }

  void toggleShowQuantity() {
    state = state.copyWith(showQuantity: !state.showQuantity);
    _saveSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final playerColorInBorder = prefs.getBool('playerColorInBorder') ?? true;
    final playerColorInCercle = prefs.getBool('playerColorInCercle') ?? true;
    final badgeTypeInImage = prefs.getBool('badgeTypeInImage') ?? true;
    final badgeTypeInText = prefs.getBool('badgeTypeInText') ?? true;
    final boardgameInTitle = prefs.getBool('boardgameInTitle') ?? true;

    state = TileSettingsEntity(
      playerColorInBorder: playerColorInBorder,
      playerColorInCercle: playerColorInCercle,
      badgeTypeInImage: badgeTypeInImage,
      badgeTypeInText: badgeTypeInText,
      boardgameInTitle: boardgameInTitle,
    );
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('playerColorInBorder', state.playerColorInBorder);
    await prefs.setBool('playerColorInCercle', state.playerColorInCercle);
    await prefs.setBool('badgeTypeInImage', state.badgeTypeInImage);
    await prefs.setBool('badgeTypeInText', state.badgeTypeInText);
    await prefs.setBool('boardgameInTitle', state.boardgameInTitle);
  }

  void toggleSettings(String action) {
    if (action == TileSettings.playerColorInBorder) togglePlayerColorInBorder();
    if (action == TileSettings.playerColorInCercle) togglePlayerColorInCercle();
    if (action == TileSettings.badgeTypeInImage) toggleBadgeTypeInImage();
    if (action == TileSettings.badgeTypeInText) toggleBadgeTypeInText();
    if (action == TileSettings.boardgameInTitle) toggleBoardgameInTitle();
    if (action == TileSettings.showQuantity) toggleShowQuantity();
  }
}

final tileSettingsNotifier =
    NotifierProvider<TileSettingsNotifier, TileSettingsEntity>(
        () => TileSettingsNotifier());
