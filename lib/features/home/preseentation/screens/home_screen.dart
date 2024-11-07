import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Home',
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
