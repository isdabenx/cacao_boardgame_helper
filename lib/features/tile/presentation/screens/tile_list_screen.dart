import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_notifier.dart';
import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileListScreen extends ConsumerWidget {
  const TileListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tiles = ref.watch(tileNotifierProvider);

    return CustomScaffold(
      title: 'Tiles',
      body: tiles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: tiles.length,
              itemBuilder: (context, index) {
                final tile = tiles[index];
                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/tiles/${tile.filenameImage}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(tile.name),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
