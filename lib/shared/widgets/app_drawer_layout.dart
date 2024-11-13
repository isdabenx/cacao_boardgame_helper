import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/shared/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AppDrawerLayout extends StatelessWidget {
  final Scaffold child;
  final ZoomDrawerController drawerController;

  const AppDrawerLayout({
    super.key,
    required this.child,
    required this.drawerController,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: drawerController,
      menuScreen: MenuWidget(
        drawerController: drawerController,
      ),
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
