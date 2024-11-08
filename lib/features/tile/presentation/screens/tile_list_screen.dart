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
                child: Row(
                  children: [
                    Text('Badge tile type in text'),
                    Spacer(),
                    Icon(
                      ref.watch(tileSettingsNotifier).badgeTypeInText
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                  ],
                ),
                onTap: () => ref
                    .read(tileSettingsNotifier.notifier)
                    .toggleBadgeTypeInText(),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Text('Badge tile type in image'),
                    Spacer(),
                    Icon(
                      ref.watch(tileSettingsNotifier).badgeTypeInImage
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                  ],
                ),
                onTap: () => ref
                    .read(tileSettingsNotifier.notifier)
                    .toggleBadgeTypeInImage(),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Text('Player color in border'),
                    Spacer(),
                    Icon(
                      ref.watch(tileSettingsNotifier).playerColorInBorder
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                  ],
                ),
                onTap: () => ref
                    .read(tileSettingsNotifier.notifier)
                    .togglePlayerColorInBorder(),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Text('Player color cercle'),
                    Spacer(),
                    Icon(
                      ref.watch(tileSettingsNotifier).playerColorInCercle
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                  ],
                ),
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
