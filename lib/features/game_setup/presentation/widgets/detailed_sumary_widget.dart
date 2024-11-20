import 'package:cacao_boardgame_helper/core/data/models/boardgame_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/module_model.dart';
import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/game_setup_state_entity.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/player_entity.dart';
import 'package:cacao_boardgame_helper/shared/widgets/container_full_style_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class DetailedSumaryWidget extends StatelessWidget {
  const DetailedSumaryWidget({super.key, required this.gameSetup});

  final GameSetupStateEntity gameSetup;
  @override
  Widget build(BuildContext context) {
    final List<PlayerEntity> players = gameSetup.players;
    final List<BoardgameModel> expansions = gameSetup.expansions;
    final List<ModuleModel> modules = gameSetup.modules;
    final List<TileModel> tiles = gameSetup.tiles;

    return ContainerFullStyleWidget(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(text: "Players"),
            Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              children: [
                TableRow(
                  children: [
                    LeftTextCell(text: 'Quantity:'),
                    RightTextCell(text: players.length.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    LeftTextCell(text: 'Names:'),
                    RightTextCell(text: players.map((e) => e.name).join(', ')),
                  ],
                ),
                TableRow(
                  children: [
                    LeftTextCell(text: 'Colors:'),
                    RightTextCell(text: players.map((e) => e.color).join(', ')),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            HeaderWidget(text: "Game & Expansions"),
            Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              children: [
                TableRow(
                  children: [
                    LeftTextCell(text: 'Quantity:'),
                    RightTextCell(text: expansions.length.toString()),
                  ],
                ),
                TableRow(
                  children: [
                    LeftTextCell(text: 'Names:'),
                    RightTextCell(
                        text: expansions.map((e) => e.name).join(', ')),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            HeaderWidget(text: "Modules"),
            Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              children: [
                TableRow(
                  children: [
                    LeftTextCell(text: 'Quantity:'),
                    RightTextCell(text: modules.length.toString()),
                  ],
                ),
                if (modules.isNotEmpty)
                  TableRow(
                    children: [
                      LeftTextCell(text: 'Names:'),
                      RightTextCell(
                          text: modules.map((e) => e.name).join(', ')),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 16),
            HeaderWidget(text: "Tiles"),
            Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              children: [
                for (final tile in tiles)
                  TableRow(
                    children: [
                      LeftTextCell(
                          text: (tile.color != null)
                              ? '${tile.name} (${tile.color.toString().split('.').last})'
                              : tile.name),
                      RightTextCell(text: tile.quantity.toString()),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LeftCell extends StatelessWidget {
  const LeftCell({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: child,
      ),
    );
  }
}

class LeftTextCell extends StatelessWidget {
  const LeftTextCell({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return LeftCell(
        child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    ));
  }
}

class RightCell extends StatelessWidget {
  const RightCell({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: child,
      ),
    );
  }
}

class RightTextCell extends StatelessWidget {
  const RightTextCell({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return RightCell(
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
