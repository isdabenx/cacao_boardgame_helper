import 'package:cacao_boardgame_helper/features/game_setup/presentation/widgets/select_expansion_widget.dart';
import 'package:cacao_boardgame_helper/shared/providers/boardgame_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepExpansionWidget extends StatelessWidget {
  const StepExpansionWidget({
    super.key,
    required this.heightAllExpansions,
    required this.heightExpansion,
    required this.widthExpansion,
  });

  final double heightAllExpansions;
  final double heightExpansion;
  final double widthExpansion;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text("Select the expansions you're playing with"),
        ),
        SizedBox(
          height: heightAllExpansions,
          child: Consumer(builder: (context, ref, child) {
            final boardgames = ref.read(boardgameNotifierProvider);
            boardgames.removeWhere((element) => element.id == 1);

            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: boardgames.length,
                itemBuilder: (context, index) {
                  return SelectExpansionWidget(
                    boardgame: boardgames[index],
                    height: heightExpansion,
                    width: widthExpansion,
                  );
                });
          }),
        ),
      ],
    );
  }
}
