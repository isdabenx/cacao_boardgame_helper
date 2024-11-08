import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_settings_notifier.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/card_tile_badge_row_widget.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/card_tile_boardgame_title_widget.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/card_tile_image_widget.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/card_tile_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardTileWidget extends ConsumerWidget {
  final TileModel tile;
  const CardTileWidget({super.key, required this.tile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tileSettings = ref.watch(tileSettingsNotifier);
    Color? tileColor = tile.color == null
        ? null
        : AppColors.findColorByName(tile.color.toString().split('.').last);

    Color borderColor = (tileColor != null && tileSettings.playerColorInBorder)
        ? tileColor
        : AppColors.tileBorder;

    return Container(
      decoration: _cardTileDecoration(borderColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTileImageWidget(
            tileType: tile.typeAsString,
            filenameImage: tile.filenameImage,
            badgeTypeInImage: tileSettings.badgeTypeInImage,
          ),
          if (tileSettings.boardgameInTitle)
            CardTileBoardgameTitleWidget(
              title: tile.boardgame.value!.name,
              color: borderColor,
            ),
          if (tileSettings.badgeTypeInText || tileSettings.playerColorInCercle)
            CardTileBadgeRowWidget(
              tileType: tile.typeAsString,
              color: tileColor,
              playerColorInCercle: tileSettings.playerColorInCercle,
              badgeTypeInText: tileSettings.badgeTypeInText,
            ),
          CardTileNameWidget(name: tile.name),
        ],
      ),
    );
  }
}

Decoration _cardTileDecoration(Color borderColor) {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.tileShadow,
        blurRadius: 4.0,
        spreadRadius: 2.0,
        offset: Offset(0, 2),
      ),
    ],
    color: AppColors.tileBackground,
    border: Border.all(
      color: borderColor,
    ),
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(8.0),
      bottomRight: Radius.circular(8.0),
    ),
  );
}
