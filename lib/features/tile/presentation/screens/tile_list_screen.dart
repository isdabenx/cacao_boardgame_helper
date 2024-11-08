import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_notifier.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_settings_notifier.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/card_tile_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TileListScreen extends ConsumerWidget {
  const TileListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tiles = ref.watch(tileNotifierProvider);

    return CustomScaffold(
      title: 'Tiles',
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            showMaterialModalBottomSheet(
              context: context,
              builder: (context) {
                return Consumer(
                  builder: (context, ref, child) {
                    final tileSettings = ref.watch(tileSettingsNotifier);
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CheckboxListTile(
                            title: Text('Boardgame title'),
                            value: tileSettings.boardgameInTitle,
                            onChanged: (value) {
                              ref
                                  .read(tileSettingsNotifier.notifier)
                                  .toggleBoardgameInTitle();
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Badge tile type in text'),
                            value: tileSettings.badgeTypeInText,
                            onChanged: (value) {
                              ref
                                  .read(tileSettingsNotifier.notifier)
                                  .toggleBadgeTypeInText();
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Badge tile type in image'),
                            value: tileSettings.badgeTypeInImage,
                            onChanged: (value) {
                              ref
                                  .read(tileSettingsNotifier.notifier)
                                  .toggleBadgeTypeInImage();
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Player color in border'),
                            value: tileSettings.playerColorInBorder,
                            onChanged: (value) {
                              ref
                                  .read(tileSettingsNotifier.notifier)
                                  .togglePlayerColorInBorder();
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Player color in cercle'),
                            value: tileSettings.playerColorInCercle,
                            onChanged: (value) {
                              ref
                                  .read(tileSettingsNotifier.notifier)
                                  .togglePlayerColorInCercle();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
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
