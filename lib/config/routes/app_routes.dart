import 'package:cacao_boardgame_helper/features/home/preseentation/screens/home_screen.dart';
import 'package:cacao_boardgame_helper/features/splash/presentation/screens/splash_screen.dart';
import 'package:cacao_boardgame_helper/features/tile/presentation/screens/tile_list_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String tile = '/tile';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    tile: (context) => const TileListScreen(),
  };
}
