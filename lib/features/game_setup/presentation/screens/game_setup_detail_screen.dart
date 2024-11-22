import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/game_setup_state_entity.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/detailed_preparation_widget.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/detailed_sumary_widget.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/settings_icon_widget.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/tile_list_grill_widget.dart';
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
        appBarBottom: TabBar(
          indicatorColor: AppColors.greenDarker,
          tabs: [
            Tab(
              child: Text(
                'Sumary',
                textAlign: TextAlign.center,
                style: AppTextStyles.boardgameTitleTextStyle
                    .copyWith(fontSize: 16),
              ),
            ),
            Tab(
              child: Text('Preparation',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.boardgameTitleTextStyle
                      .copyWith(fontSize: 16)),
            ),
            Tab(
              child: Text(
                'Tiles',
                textAlign: TextAlign.center,
                style: AppTextStyles.boardgameTitleTextStyle
                    .copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            DetailedSumaryWidget(gameSetup: gameSetup),
            DetailedPreparationWidget(preparation: gameSetup.preparation),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TileListGrillWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
