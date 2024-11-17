import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/providers/game_setup_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartButtonWidget extends ConsumerWidget {
  const StartButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSetupState = ref.watch(gameSetupProvider);
    final bool isStartButtonEnabled = gameSetupState.players
            .where((p) => p.isSelected && p.name.isNotEmpty)
            .length >=
        2;

    return ElevatedButton(
      onPressed: isStartButtonEnabled ? () {} : null,
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
    );
  }
}
