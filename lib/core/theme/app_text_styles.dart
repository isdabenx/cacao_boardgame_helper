import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle loadingTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 44,
    fontFamily: AppFonts.headerFont,
  );

  static const TextStyle boardgameTitleTextStyle = TextStyle(
    color: AppColors.green,
    fontSize: 18,
    fontFamily: AppFonts.headerFont,
  );

  static const TextStyle tileTypeTextStyle = TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.bodyFont,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle tileNameTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.bodyFont,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle tileBadgeTextStyle = TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.bodyFont,
    fontWeight: FontWeight.w500,
  );
}
