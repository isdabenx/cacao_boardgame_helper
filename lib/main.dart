import 'package:cacao_boardgame_helper/config/routes/app_routes.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          iconTheme: IconThemeData(
            color: AppColors.iconColor,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.appBarBackground,
            iconTheme: IconThemeData(
              color: AppColors.iconColor,
            ),
            titleTextStyle: AppTextStyles.appBarTextStyle,
          )),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
