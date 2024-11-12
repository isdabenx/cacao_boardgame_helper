import 'package:cacao_boardgame_helper/config/routes/app_routes.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/shared/providers/menu_controller_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuWidget extends ConsumerWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawerController = ref.watch(
      menuControllerProvider,
    );

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
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () => navigateTo(AppRoutes.home),
                  ),
                  ListTile(
                    leading: Icon(Icons.line_style),
                    title: Text('Tiles'),
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
