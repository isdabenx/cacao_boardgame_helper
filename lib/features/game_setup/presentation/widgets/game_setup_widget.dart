import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/select_module_widget.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/start_button_widget.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/step_expansion_widget.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/step_player_widget.dart';
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
    final double heightAllExpansions = 200;
    final double heightExpansion = heightAllExpansions - 25;
    final double widthExpansion = heightExpansion * 0.72;
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
                  content: StepPlayerWidget(),
                ),
                Step(
                  title: Text('Expansions (in construction)',
                      style: AppTextStyles.labelStep),
                  content: StepExpansionWidget(
                    heightAllExpansions: heightAllExpansions,
                    heightExpansion: heightExpansion,
                    widthExpansion: widthExpansion,
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
        StartButtonWidget(),
      ],
    );
  }
}
