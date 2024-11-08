import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color menuBackground = Colors.green;
  static const Color green = Colors.green;
  static Color badgeBackground = Colors.greenAccent.shade400;
  static const Color badgeText = Colors.white;
  static const Color badgeTransparentBackground = Colors.greenAccent;
  static const Color badgeTransparentText = Colors.black;
  static Color tileBackground = Colors.greenAccent.shade100;
  static const Color tileBorder = Colors.grey;
  static Color tileShadow = Colors.grey.shade300;

  static final Map<String, Color> colors = {
    'white': white,
    'red': Colors.red,
    'purple': Colors.purple,
    'yellow': Colors.yellow,
  };

  static Color findColorByName(String color) {
    return colors[color] ?? Colors.transparent;
  }
}
