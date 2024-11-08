import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardTileBadgeRowWidget extends StatelessWidget {
  const CardTileBadgeRowWidget({
    super.key,
    this.color,
    required this.tileType,
    required this.playerColorInCercle,
    required this.badgeTypeInText,
  });

  final Color? color;
  final String tileType;
  final bool playerColorInCercle;
  final bool badgeTypeInText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 6.0,
        right: 6,
        top: 6,
      ),
      child: Wrap(
        spacing: 4,
        children: [
          if (badgeTypeInText)
            Badge(
              backgroundColor: AppColors.badgeBackground,
              label: Padding(
                padding: const EdgeInsets.only(
                  left: 2,
                  right: 2,
                  bottom: 2,
                ),
                child: Text(
                  tileType,
                  style: AppTextStyles.tileTypeTextStyle,
                ),
              ),
            ),
          if (color != null && playerColorInCercle)
            CircleAvatar(
              radius: 9,
              backgroundColor: color,
            )
        ],
      ),
    );
  }
}
