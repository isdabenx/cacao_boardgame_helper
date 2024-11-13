import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_notifier.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/card_tile_widget.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/settings_icon_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold_widget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileListScreen extends StatelessWidget {
  const TileListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      title: 'Tiles',
      actions: [SettingsIconWidget()],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(builder: (context, ref, child) {
          final tiles = ref.watch(tileNotifierProvider);
          return DynamicHeightGridView(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            itemCount: tiles.length,
            builder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/tile_detail',
                    arguments: tiles[index],
                  );
                },
                child: CardTileWidget(tile: tiles[index]),
              );
            },
          );
        }),
      ),
    );
  }
}
