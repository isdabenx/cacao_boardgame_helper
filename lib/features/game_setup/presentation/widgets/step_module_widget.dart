import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/providers/game_setup_notifier.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/select_module_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepModuleWidget extends ConsumerWidget {
  const StepModuleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSetupState = ref.watch(gameSetupProvider);

    final boardgames = gameSetupState.expansions;
    final List<ModuleModel> modules =
        boardgames.map((e) => e.modules).expand((element) => element).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select the modules you're playing with"),
        Column(
          children: [
            if (modules.isEmpty)
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "No expansion with modules are selected",
                        style: AppTextStyles.boardgameTitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            for (ModuleModel module in modules)
              SelectModuleWidget(module: module),
          ],
        ),
      ],
    );
  }
}
