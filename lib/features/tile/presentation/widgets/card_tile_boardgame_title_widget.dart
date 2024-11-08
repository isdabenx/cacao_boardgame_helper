import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardTileBoardgameTitleWidget extends StatelessWidget {
  const CardTileBoardgameTitleWidget({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title.toUpperCase(),
            style: AppTextStyles.boardgameTitleTextStyle,
          ),
        ),
        Divider(
          height: 1,
          color: color,
          thickness: 0.5,
        ),
      ],
    );
  }
}
