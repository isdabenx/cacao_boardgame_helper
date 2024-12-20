import 'package:cacao_boardgame_helper/config/constants/tile_settings.dart';

class TileSettingsEntity {
  final bool playerColorInBorder;
  final bool playerColorInCercle;
  final bool badgeTypeInImage;
  final bool badgeTypeInText;
  final bool boardgameInTitle;
  final bool showQuantity;

  TileSettingsEntity({
    this.playerColorInBorder = true,
    this.playerColorInCercle = true,
    this.badgeTypeInImage = true,
    this.badgeTypeInText = true,
    this.boardgameInTitle = true,
    this.showQuantity = true,
  });

  TileSettingsEntity copyWith({
    bool? playerColorInBorder,
    bool? playerColorInCercle,
    bool? badgeTypeInImage,
    bool? badgeTypeInText,
    bool? boardgameInTitle,
    bool? showQuantity,
  }) {
    return TileSettingsEntity(
      playerColorInBorder: playerColorInBorder ?? this.playerColorInBorder,
      playerColorInCercle: playerColorInCercle ?? this.playerColorInCercle,
      badgeTypeInImage: badgeTypeInImage ?? this.badgeTypeInImage,
      badgeTypeInText: badgeTypeInText ?? this.badgeTypeInText,
      boardgameInTitle: boardgameInTitle ?? this.boardgameInTitle,
      showQuantity: showQuantity ?? this.showQuantity,
    );
  }

  bool settings(String action) {
    if (action == TileSettings.playerColorInBorder) return playerColorInBorder;
    if (action == TileSettings.playerColorInCercle) return playerColorInCercle;
    if (action == TileSettings.badgeTypeInImage) return badgeTypeInImage;
    if (action == TileSettings.badgeTypeInText) return badgeTypeInText;
    if (action == TileSettings.boardgameInTitle) return boardgameInTitle;
    if (action == TileSettings.showQuantity) return showQuantity;
    return false;
  }
}
