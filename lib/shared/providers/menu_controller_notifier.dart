import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuControllerNotifier extends Notifier<ZoomDrawerController> {
  @override
  ZoomDrawerController build() {
    return ZoomDrawerController();
  }

  void toggle() {
    state.toggle?.call();
  }

  void open() {
    state.open?.call();
  }

  void close() {
    state.close?.call();
  }
}

final menuControllerProvider =
    NotifierProvider<MenuControllerNotifier, ZoomDrawerController>(
        () => MenuControllerNotifier());
