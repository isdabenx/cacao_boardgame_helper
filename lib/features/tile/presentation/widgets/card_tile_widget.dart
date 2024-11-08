import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_fonts.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardTileWidget extends StatelessWidget {
  final TileModel tile;
  const CardTileWidget({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
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
          color: tileColor ?? Colors.grey,
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
          Center(
            child: Text(
              tile.boardgame.value!.name.toUpperCase(),
              style: AppTextStyles.loadingTextStyle.copyWith(
                fontSize: 18.0,
                color: Colors.green,
              ),
            ),
          ),
          Divider(
            height: 1,
            color: tileColor ?? Colors.grey,
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 6.0,
              right: 6,
              top: 6,
            ),
            child: Wrap(
              spacing: 4,
              children: [
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
                if (tileColor != null)
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
