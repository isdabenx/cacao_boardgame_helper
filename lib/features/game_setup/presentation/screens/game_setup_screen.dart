import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/game_setup_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/container_full_style_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold_widget.dart';
import 'package:flutter/material.dart';

class GameSetupScreen extends StatelessWidget {
  const GameSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
        body: ContainerFullStyleWidget(
          child: GameSetupWidget(),
        ),
        title: 'Game Setup');
  }
}
