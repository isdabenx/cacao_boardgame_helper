import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/providers/game_setup_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectModuleWidget extends ConsumerWidget {
  const SelectModuleWidget({
    super.key,
    required this.module,
  });

  final ModuleModel module;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSetupState = ref.read(gameSetupProvider);
    final gameSetupNotifier = ref.read(gameSetupProvider.notifier);
    final isSelected = gameSetupState.modules.any((e) => e.id == module.id);

    void onToggleModule() {
      gameSetupNotifier.toggleModule(module);
    }

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.brown,
              backgroundColor:
                  isSelected ? AppColors.greenDark : AppColors.greenNormal,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: onToggleModule,
            child: Text(module.name),
          ),
        ),
      ],
    );
  }
}
