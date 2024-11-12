import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/config/routes/app_routes.dart';
import 'package:cacao_boardgame_helper/shared/providers/menu_controller_notifier.dart';
import 'package:cacao_boardgame_helper/shared/widgets/app_drawer_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomScaffold extends ConsumerWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;

  const CustomScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppDrawerLayout(
      child: Scaffold(
        appBar: AppBar(
          actions: actions,
          title: Text(
            title ?? '',
          ),
          centerTitle: true,
          leading: showBackButton
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    // TODO: Implement back button. Issue with using Navigator.of(context).pop(), the menu not opening after pop, need to find a solution.
                    Navigator.of(context).pushReplacementNamed(AppRoutes.tile);
                  },
                )
              : IconButton(
                  onPressed: () {
                    ref.read(menuControllerProvider.notifier).open();
                  },
                  icon: Icon(Icons.menu),
                ),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.background,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: body),
      ),
    );
  }
}
