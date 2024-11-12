import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TileDetailScreen extends StatelessWidget {
  const TileDetailScreen({super.key, required this.tile});

  final TileModel tile;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: true,
      title: tile.typeAsString,
      body: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.greenLight,
          border: Border.all(
            color: AppColors.greenDarker,
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.tileBorder,
                    width: 4.0,
                  ),
                ),
                child: Image.asset(
                  '${Assets.imagesTilePath}${tile.filenameImage}',
                ),
              ),
              SizedBox(height: 8.0),
              Text(tile.name, style: AppTextStyles.titleTextStyle),
              SizedBox(height: 8.0),
              MarkdownBody(
                data: tile.description,
                styleSheet: MarkdownStyleSheet(
                  strong: AppTextStyles.markdownBold,
                  p: AppTextStyles.markdownBody,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
