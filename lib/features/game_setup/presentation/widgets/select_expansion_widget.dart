import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/providers/game_setup_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectExpansionWidget extends ConsumerWidget {
  const SelectExpansionWidget({
    super.key,
    required this.boardgame,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
  final BoardgameModel boardgame;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSetupState = ref.watch(gameSetupProvider);
    final gameSetupNotifier = ref.read(gameSetupProvider.notifier);
    final isSelected =
        gameSetupState.expansions.any((e) => e.id == boardgame.id);

    void onToggleExpansion() {
      gameSetupNotifier.toggleExpansion(boardgame);
    }

    return GestureDetector(
      onTap: onToggleExpansion,
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.transparent,
                width: 2.0,
              ),
              image: DecorationImage(
                image: AssetImage(
                    '${Assets.imagesBoardgamePath}${boardgame.filenameImage}'),
                fit: BoxFit.cover,
                colorFilter: isSelected
                    ? null
                    : ColorFilter.mode(Colors.grey, BlendMode.saturation),
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            boardgame.name,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
