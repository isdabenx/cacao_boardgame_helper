import 'package:cacao_boardgame_helper/core/constants/assets.dart';
import 'package:cacao_boardgame_helper/features/splash/presentation/widgets/mirrored_image.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.splashBackground),
        MirroredImage(),
      ],
    );
  }
}
