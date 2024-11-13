import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_markdown_style_sheet.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/shared/widgets/container_full_style_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileDetailScreen extends ConsumerWidget {
  const TileDetailScreen({super.key, required this.tile});

  final TileModel tile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      showBackButton: true,
      title: tile.typeAsString,
      body: ContainerFullStyleWidget(
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
                styleSheet: AppMarkdownStyleSheet.styleSheet,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
