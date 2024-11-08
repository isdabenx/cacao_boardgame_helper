class TileSettingsEntity {
  final bool playerColorInBorder;
  final bool playerColorInCercle;
  final bool badgeTypeInImage;
  final bool badgeTypeInText;

  TileSettingsEntity({
    this.playerColorInBorder = true,
    this.playerColorInCercle = true,
    this.badgeTypeInImage = true,
    this.badgeTypeInText = true,
  });

  TileSettingsEntity copyWith({
    bool? playerColorInBorder,
    bool? playerColorInCercle,
    bool? badgeTypeInImage,
    bool? badgeTypeInText,
  }) {
    return TileSettingsEntity(
      playerColorInBorder: playerColorInBorder ?? this.playerColorInBorder,
      playerColorInCercle: playerColorInCercle ?? this.playerColorInCercle,
      badgeTypeInImage: badgeTypeInImage ?? this.badgeTypeInImage,
      badgeTypeInText: badgeTypeInText ?? this.badgeTypeInText,
    );
  }
}
