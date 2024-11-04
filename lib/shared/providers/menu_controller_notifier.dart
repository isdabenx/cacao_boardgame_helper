import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuControllerNotifier extends StateNotifier<ZoomDrawerController> {
  MenuControllerNotifier() : super(ZoomDrawerController());

  void toggle() {
    state.toggle?.call();
  }
}

final menuControllerProvider =
    StateNotifierProvider<MenuControllerNotifier, ZoomDrawerController>(
        (ref) => MenuControllerNotifier());
