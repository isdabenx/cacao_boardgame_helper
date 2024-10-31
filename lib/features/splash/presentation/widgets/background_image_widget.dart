import 'package:cacao_boardgame_helper/core/constants/assets.dart';
import 'package:cacao_boardgame_helper/features/splash/presentation/widgets/mirrored_image_widget.dart';
import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.splashBackground),
        MirroredImageWidget(),
      ],
    );
  }
}
