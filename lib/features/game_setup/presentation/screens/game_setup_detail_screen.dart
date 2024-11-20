import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/game_setup_state_entity.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/detailed_sumary_widget.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/settings_icon_widget.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/tile_list_grill_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/container_full_style_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold_widget.dart';
import 'package:flutter/material.dart';

class GameSetupDetailScreen extends StatelessWidget {
  const GameSetupDetailScreen({super.key, required this.gameSetup});

  final GameSetupStateEntity gameSetup;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CustomScaffoldWidget(
        actions: [SettingsIconWidget()],
        title: 'Game Setup',
        showBackButton: true,
        appBarBottom: TabBar(tabs: [
          Tab(text: 'Sumary'),
          Tab(text: 'Game Preparation'),
          Tab(text: 'Tiles'),
        ]),
        body: TabBarView(
          children: [
            DetailedSumaryWidget(gameSetup: gameSetup),
            ContainerFullStyleWidget(
              child: Text('data2'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TileListGrillWidget(
                filteredTiles: gameSetup.tiles,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
