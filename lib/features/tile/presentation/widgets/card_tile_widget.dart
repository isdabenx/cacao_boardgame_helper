import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_fonts.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_settings_notifier.dart';
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

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4.0,
            spreadRadius: 2.0,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.greenAccent.shade100,
        border: Border.all(
          color: (tileColor != null && tileSettings.playerColorInBorder)
              ? tileColor
              : Colors.grey,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/tiles/${tile.filenameImage}',
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
              if (tileSettings.badgeTypeInImage)
                Positioned(
                  top: 4,
                  left: 4,
                  child: Opacity(
                    opacity: 0.75,
                    child: Badge(
                      backgroundColor: Colors.greenAccent,
                      textColor: Colors.black,
                      label: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Text(
                          tile.type.toString().split('.').last,
                          style: TextStyle(
                            fontFamily: AppFonts.bodyFont,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
          if (tileSettings.boardgameInTitle)
            Center(
              child: Text(
                tile.boardgame.value!.name.toUpperCase(),
                style: AppTextStyles.loadingTextStyle.copyWith(
                  fontSize: 18.0,
                  color: Colors.green,
                ),
              ),
            ),
          if (tileSettings.boardgameInTitle)
            Divider(
              height: 1,
              color: (tileColor != null && tileSettings.playerColorInBorder)
                  ? tileColor
                  : Colors.grey,
              thickness: 0.5,
            ),
          if (tileSettings.badgeTypeInText || tileSettings.playerColorInCercle)
            Padding(
              padding: const EdgeInsets.only(
                left: 6.0,
                right: 6,
                top: 6,
              ),
              child: Wrap(
                spacing: 4,
                children: [
                  if (tileSettings.badgeTypeInText)
                    Badge(
                      backgroundColor: Colors.greenAccent.shade400,
                      label: Padding(
                        padding: const EdgeInsets.only(
                          left: 2,
                          right: 2,
                          bottom: 2,
                        ),
                        child: Text(
                          tile.type.toString().split('.').last,
                          style: TextStyle(
                              fontFamily: AppFonts.bodyFont,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  if (tileColor != null && tileSettings.playerColorInCercle)
                    CircleAvatar(
                      radius: 9,
                      backgroundColor: tileColor,
                    )
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              tile.name,
              style: TextStyle(
                fontFamily: AppFonts.bodyFont,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
