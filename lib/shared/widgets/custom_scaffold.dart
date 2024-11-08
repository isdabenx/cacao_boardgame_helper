import 'package:cacao_boardgame_helper/shared/providers/menu_controller_notifier.dart';
import 'package:cacao_boardgame_helper/shared/widgets/app_drawer_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomScaffold extends ConsumerWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;

  const CustomScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuControllerNotifier = ref.watch(menuControllerProvider.notifier);
    return AppDrawerLayout(
        child: Scaffold(
      appBar: AppBar(
        actions: actions,
        title: Text(title ?? ''),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            menuControllerNotifier.toggle();
          },
          icon: Icon(Icons.menu),
        ),
      ),
      body: body,
    ));
  }
}
