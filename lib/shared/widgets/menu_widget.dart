import 'package:cacao_boardgame_helper/config/routes/app_routes.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key, required this.drawerController});
  final ZoomDrawerController drawerController;

  @override
  Widget build(BuildContext context) {
    void onTapped(Function action) {
      drawerController.close!();
      Future.delayed(
        Duration(milliseconds: 250),
        () => action(),
      );
    }

    void navigateTo(String route) {
      onTapped(
        () => Navigator.of(context).pushReplacementNamed(route),
      );
    }

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
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: AppColors.iconColor,
                    ),
                    title: Text(
                      'Home',
                      style: AppTextStyles.menu,
                    ),
                    onTap: () => navigateTo(AppRoutes.home),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.library_books,
                      color: AppColors.iconColor,
                    ),
                    title: Text(
                      'Rules',
                      style: AppTextStyles.menu,
                    ),
                    onTap: () => navigateTo(AppRoutes.rule),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.widgets,
                      color: AppColors.iconColor,
                    ),
                    title: Text(
                      'Tiles',
                      style: AppTextStyles.menu,
                    ),
                    onTap: () => navigateTo(AppRoutes.tile),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
