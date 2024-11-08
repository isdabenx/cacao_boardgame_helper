import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_notifier.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_settings_notifier.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/card_tile_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileListScreen extends ConsumerWidget {
  const TileListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tiles = ref.watch(tileNotifierProvider);

    return CustomScaffold(
      title: 'Tiles',
      actions: [
        PopupMenuButton(
          icon: Icon(Icons.settings),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text('Badge tile type in text'),
                onTap: () => ref
                    .read(tileSettingsNotifier.notifier)
                    .toggleBadgeTypeInText(),
              ),
              PopupMenuItem(
                child: Text('Badge tile type in image'),
                onTap: () => ref
                    .read(tileSettingsNotifier.notifier)
                    .toggleBadgeTypeInImage(),
              ),
              PopupMenuItem(
                child: Text('Player color in border'),
                onTap: () => ref
                    .read(tileSettingsNotifier.notifier)
                    .togglePlayerColorInBorder(),
              ),
              PopupMenuItem(
                child: Text('Player color cercle'),
                onTap: () => ref
                    .read(tileSettingsNotifier.notifier)
                    .togglePlayerColorInCercle(),
              ),
            ];
          },
        ),
      ],
      body: tiles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: DynamicHeightGridView(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                itemCount: tiles.length,
                builder: (context, index) {
                  return CardTileWidget(tile: tiles[index]);
                },
              ),
            ),
    );
  }
}
