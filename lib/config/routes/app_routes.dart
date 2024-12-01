import 'package:cacao_boardgame_helper/core/data/models/tile_model.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/game_setup_state_entity.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/screens/game_setup_detail_screen.dart';
import 'package:cacao_boardgame_helper/features/game_setup/presentation/screens/game_setup_screen.dart';
import 'package:cacao_boardgame_helper/features/home/presentation/screens/home_screen.dart';
import 'package:cacao_boardgame_helper/features/rule/presentation/rule_screen.dart';
import 'package:cacao_boardgame_helper/features/splash/presentation/screens/splash_screen.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_notifier.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/screens/tile_detail_screen.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/screens/tile_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String tile = '/tile';
  static const String rule = '/rule';
  static const String tileDetail = '/tile_detail';
  static const String gameSetup = '/game_setup';
  static const String gameSetupDetail = '/game_setup_detail';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    rule: (context) => const RuleScreen(),
    tile: (context) => Consumer(
          builder: (context, ref, child) {
            Future(() {
              ref.read(tileNotifierProvider.notifier).loadTiles();
            });
            return const TileListScreen();
          },
        ),
    gameSetup: (context) => const GameSetupScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == tileDetail) {
      final tile = settings.arguments! as TileModel;
      return MaterialPageRoute(
        builder: (context) => TileDetailScreen(tile: tile),
      );
    } else if (settings.name == gameSetupDetail) {
      final gameSetup = settings.arguments! as GameSetupStateEntity;
      return MaterialPageRoute(
        builder: (context) => Consumer(
          builder: (context, ref, child) {
            Future(() {
              ref
                  .read(tileNotifierProvider.notifier)
                  .pushTiles(gameSetup.tiles);
            });
            return GameSetupDetailScreen(gameSetup: gameSetup);
          },
        ),
      );
    }
    return null;
  }
}
