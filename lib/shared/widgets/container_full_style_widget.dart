import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerFullStyleWidget extends StatelessWidget {
  const ContainerFullStyleWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.greenLight,
        border: Border.all(
          color: AppColors.greenDarker,
          width: 4.0,
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: child,
    );
  }
}
