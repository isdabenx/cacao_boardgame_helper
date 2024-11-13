import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/shared/widgets/app_drawer_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;

  CustomScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.showBackButton = false,
  });

  final ZoomDrawerController drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return AppDrawerLayout(
      drawerController: drawerController,
      child: Scaffold(
        appBar: AppBar(
          actions: actions,
          title: Text(
            title ?? '',
          ),
          centerTitle: true,
          leading: showBackButton
              ? null
              : IconButton(
                  onPressed: () {
                    drawerController.open?.call();
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
