import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileListScreen extends ConsumerWidget {
  const TileListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tiles = ref.watch(tileNotifierProvider);

    return Scaffold(
      body: tiles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tiles.length,
              itemBuilder: (context, index) {
                final tile = tiles[index];
                return ListTile(
                  title: Text(tile.name),
                  subtitle: Text(tile.description),
                );
              },
            ),
    );
  }
}
