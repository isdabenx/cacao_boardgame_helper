import 'package:cacao_boardgame_helper/config/routes/app_routes.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key, required this.drawerController});
  final ZoomDrawerController drawerController;

  void _onTapped(Function action) {
    drawerController.close!();
    Future.delayed(Duration(milliseconds: 250), () => action());
  }

  void _navigateTo(BuildContext context, String route) {
    _onTapped(
      () => Navigator.of(context).pushReplacementNamed(route),
    );
  }

  Widget _menuItem(
      BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, color: AppColors.iconColor),
      title: Text(title, style: AppTextStyles.menu),
      onTap: () => _navigateTo(context, route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.menuBackground,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Text('Menu', style: AppTextStyles.loadingTextStyle),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _menuItem(context, Icons.home, 'Home', AppRoutes.home),
                  _menuItem(
                      context, Icons.group, 'Game setup', AppRoutes.gameSetup),
                  _menuItem(context, Icons.widgets, 'Tiles', AppRoutes.tile),
                  _menuItem(
                      context, Icons.library_books, 'Rules', AppRoutes.rule),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
