import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardTileImageWidget extends StatelessWidget {
  const CardTileImageWidget({
    super.key,
    required this.tileType,
    required this.filenameImage,
    required this.badgeTypeInImage,
    required this.quantity,
    required this.showQuantity,
  });

  final String tileType;
  final String filenameImage;
  final bool badgeTypeInImage;
  final int quantity;
  final bool showQuantity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          '${Assets.imagesTilePath}$filenameImage',
          fit: BoxFit.cover,
          width: double.maxFinite,
        ),
        if (badgeTypeInImage)
          Positioned(
            top: 4,
            left: 4,
            child: Opacity(
              opacity: 0.75,
              child: Badge(
                backgroundColor: AppColors.badgeTransparentBackground,
                label: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Text(
                    tileType,
                    style: AppTextStyles.tileBadgeTextStyle,
                  ),
                ),
              ),
            ),
          ),
        if (showQuantity)
          Positioned(
              bottom: 4,
              right: 4,
              child: Text('x$quantity',
                  style: AppTextStyles.tileQuantityTextStyle)),
      ],
    );
  }
}
