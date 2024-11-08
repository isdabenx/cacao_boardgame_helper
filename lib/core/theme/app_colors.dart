import 'package:flutter/material.dart';

class AppColors {
  static const white = Colors.white;
  static const menuBackground = Colors.green;

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
