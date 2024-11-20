import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/settings_icon_widget.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/tile_list_grill_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold_widget.dart';
import 'package:flutter/material.dart';

class TileListScreen extends StatelessWidget {
  const TileListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      title: 'Tiles',
      actions: [SettingsIconWidget()],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TileListGrillWidget(),
      ),
    );
  }
}
