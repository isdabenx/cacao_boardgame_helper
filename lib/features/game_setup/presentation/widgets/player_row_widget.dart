import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/player_entity.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/providers/game_setup_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerRowWidget extends ConsumerStatefulWidget {
  const PlayerRowWidget({
    super.key,
    required this.colorString,
  });

  final String colorString;

  @override
  ConsumerState<PlayerRowWidget> createState() => _PlayerRowWidgetState();
}

class _PlayerRowWidgetState extends ConsumerState<PlayerRowWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameSetupState = ref.watch(gameSetupProvider);
    final gameSetupNotifier = ref.read(gameSetupProvider.notifier);

    final player = gameSetupState.players.firstWhere(
      (p) => p.color == widget.colorString,
      orElse: () =>
          PlayerEntity(name: '', color: widget.colorString, isSelected: false),
    );

    bool isSelected = player.isSelected;
    if (isSelected) {
      controller.text = player.name;
    }

    void onTogglePlayer() {
      setState(() {
        isSelected = !isSelected;
        gameSetupNotifier.updatePlayerSelection(widget.colorString, isSelected);
        if (isSelected) {
          gameSetupNotifier.addPlayer(controller.text, widget.colorString);
        } else {
          gameSetupNotifier.removePlayer(player.name);
        }
      });
    }

    void onPlayerNameChanged(String name) {
      if (isSelected) {
        gameSetupNotifier.removePlayer(player.name);
        gameSetupNotifier.addPlayer(name, widget.colorString);
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTogglePlayer,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.findColorByName(widget.colorString),
              border: Border.all(
                color: isSelected ? AppColors.brown : AppColors.greenNormal,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Visibility(
            visible: isSelected,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Player Name',
              ),
              controller: controller,
              onChanged: onPlayerNameChanged,
            ),
          ),
        ),
      ],
    );
  }
}
