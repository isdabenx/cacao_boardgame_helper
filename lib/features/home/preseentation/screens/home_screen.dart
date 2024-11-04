import 'package:cacao_boardgame_helper/shared/providers/menu_controller_notifier.dart';
import 'package:cacao_boardgame_helper/shared/widgets/app_drawer_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuControllerNotifier = ref.read(menuControllerProvider.notifier);
    return AppDrawerLayout(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                menuControllerNotifier.toggle();
              },
              icon: Icon(Icons.menu)),
        ),
        body: Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
