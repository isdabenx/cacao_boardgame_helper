import 'package:cacao_boardgame_helper/config/constants/tile_settings.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/settings_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SettingsIconWidget extends StatelessWidget {
  const SettingsIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SettingsItemWidget(
                    title: 'Boardgame title',
                    settingsName: TileSettings.boardgameInTitle,
                  ),
                  SettingsItemWidget(
                    title: 'Badge tile type in text',
                    settingsName: TileSettings.badgeTypeInText,
                  ),
                  SettingsItemWidget(
                    title: 'Badge tile type in image',
                    settingsName: TileSettings.badgeTypeInImage,
                  ),
                  SettingsItemWidget(
                    title: 'Player color in border',
                    settingsName: TileSettings.playerColorInBorder,
                  ),
                  SettingsItemWidget(
                    title: 'Player color in cercle',
                    settingsName: TileSettings.playerColorInCercle,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
