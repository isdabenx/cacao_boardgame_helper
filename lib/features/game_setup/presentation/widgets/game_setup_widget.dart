import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/player_row_widget.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/select_expansion_widget.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/select_module_widget.dart';
import 'package:flutter/material.dart';

class GameSetupWidget extends StatefulWidget {
  const GameSetupWidget({super.key});

  @override
  State<GameSetupWidget> createState() => _GameSetupWidgetState();
}

// List<Step> steps = ;

class _GameSetupWidgetState extends State<GameSetupWidget> {
  int _currentStep = 0;

  void _onStepTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Stepper(
              stepIconMargin: EdgeInsets.all(0),
              connectorColor: WidgetStatePropertyAll(AppColors.greenDarker),
              steps: [
                Step(
                  title: Text(
                    'Players',
                    style: AppTextStyles.labelStep,
                  ),
                  content: Column(
                    children: [
                      Text(
                          'Select colors for each player and enter the name. Minimum 2 players'),
                      PlayerRowWidget(color: AppColors.white),
                      PlayerRowWidget(color: AppColors.red),
                      PlayerRowWidget(color: AppColors.purple),
                      PlayerRowWidget(color: AppColors.yellow),
                    ],
                  ),
                ),
                Step(
                  title: Text('Expansions (in construction)',
                      style: AppTextStyles.labelStep),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child:
                            Text("Select the expansions you're playing with"),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SelectExpansionWidget(
                                image: Assets.boardgameChocolatl),
                            SelectExpansionWidget(
                                image: Assets.boardgameDiamante),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Step(
                  title: const Text(
                    'Modules (in construction)',
                    style: AppTextStyles.labelStep,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Select the modules you're playing with"),
                      Column(
                        children: [
                          SelectModuleWidget(title: "Map Module"),
                          SelectModuleWidget(title: "Watering Module"),
                          SelectModuleWidget(title: "Chocolate Module"),
                          SelectModuleWidget(title: "Hut Module"),
                          SelectModuleWidget(title: "The Gem Mines"),
                          SelectModuleWidget(title: "The Tree of Life"),
                          SelectModuleWidget(title: "The Favor of the Emperor"),
                          SelectModuleWidget(title: "The New Workers"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              controlsBuilder: (_, __) => Container(),
              onStepTapped: _onStepTapped,
              currentStep: _currentStep,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: const Text(
                  'Start Game',
                  style: AppTextStyles.boardgameTitleTextStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
