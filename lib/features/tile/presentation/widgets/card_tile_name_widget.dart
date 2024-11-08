import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardTileNameWidget extends StatelessWidget {
  const CardTileNameWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(
        name,
        style: AppTextStyles.tileNameTextStyle,
      ),
    );
  }
}
