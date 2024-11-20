import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/shared/widgets/main_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomScaffoldWidget extends StatefulWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final PreferredSizeWidget? appBarBottom;

  const CustomScaffoldWidget({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.showBackButton = false,
    this.appBarBottom,
  });

  @override
  State<CustomScaffoldWidget> createState() => _CustomScaffoldWidgetState();
}

class _CustomScaffoldWidgetState extends State<CustomScaffoldWidget> {
  final ZoomDrawerController drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return MainMenuWidget(
      drawerController: drawerController,
      child: Scaffold(
        appBar: AppBar(
          bottom: widget.appBarBottom,
          actions: widget.actions,
          title: Text(
            widget.title ?? '',
          ),
          centerTitle: true,
          leading: widget.showBackButton
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
            child: widget.body),
      ),
    );
  }
}
