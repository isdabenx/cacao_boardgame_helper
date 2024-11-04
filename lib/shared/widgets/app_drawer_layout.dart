import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/shared/providers/menu_controller_notifier.dart';
import 'package:cacao_boardgame_helper/shared/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AppDrawerLayout extends ConsumerWidget {
  final Scaffold child;

  const AppDrawerLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawerController = ref.watch(menuControllerProvider);
    return ZoomDrawer(
      controller: drawerController,
      menuScreen: MenuWidget(),
      mainScreen: child,
      slideHeight: 0,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      mainScreenScale: 0.1,
      borderRadius: 24.0,
      angle: 0,
      mainScreenTapClose: true,
      menuBackgroundColor: AppColors.menuBackground,
    );
  }
}
