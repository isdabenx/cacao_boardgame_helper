import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_notifier.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/widgets/card_tile_widget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileListGrillWidget extends ConsumerStatefulWidget {
  const TileListGrillWidget({super.key, this.filteredTiles = const []});

  final List<TileModel> filteredTiles;

  @override
  ConsumerState<TileListGrillWidget> createState() =>
      _TileListGrillWidgetState();
}

class _TileListGrillWidgetState extends ConsumerState<TileListGrillWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (widget.filteredTiles.isNotEmpty) {
        ref
            .read(tileNotifierProvider.notifier)
            .filterByIds(widget.filteredTiles.map((e) => e.id).toList());
      } else {
        ref.read(tileNotifierProvider.notifier).loadTiles();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
