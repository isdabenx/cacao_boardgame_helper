import 'dart:math' as math;

import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/features/splash/presentation/widgets/blur_filter_widget.dart';
import 'package:flutter/material.dart';

class MirroredImageWidget extends StatelessWidget {
  const MirroredImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(math.pi),
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.15, 0.97, 1],
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.64),
                  Colors.black.withOpacity(0.05),
                ],
              ).createShader(rect);
            },
            blendMode: BlendMode.darken,
            child: Image.asset(Assets.splashBackground),
          ),
        ),
        BlurFilterWidget(),
      ]),
    );
  }
}
