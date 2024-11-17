import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/start_button_widget.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/step_expansion_widget.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/step_module_widget.dart';
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
                  title: Text('Expansions (work in progress)',
                      style: AppTextStyles.labelStep),
                  content: StepExpansionWidget(
                    heightAllExpansions: heightAllExpansions,
                    heightExpansion: heightExpansion,
                    widthExpansion: widthExpansion,
                  ),
                ),
                Step(
                  title: const Text(
                    'Modules (work in progress)',
                    style: AppTextStyles.labelStep,
                  ),
                  content: StepModuleWidget(),
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
