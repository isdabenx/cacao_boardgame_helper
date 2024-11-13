import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const double _offset = 0.7;
  static const TextStyle _title = TextStyle(
    fontFamily: AppFonts.headerFont,
    color: AppColors.brown,
    shadows: [
      Shadow(
        offset: Offset(-_offset, -_offset),
        color: AppColors.gold,
      ),
      Shadow(
        offset: Offset(_offset, -_offset),
        color: AppColors.gold,
      ),
      Shadow(
        offset: Offset(_offset, _offset),
        color: AppColors.gold,
      ),
      Shadow(
        offset: Offset(-_offset, _offset),
        color: AppColors.gold,
      ),
    ],
  );

  static TextStyle loadingTextStyle = _title.copyWith(fontSize: 54);
  static TextStyle appBarTextStyle = _title.copyWith(fontSize: 36);
  static TextStyle titleTextStyle = _title.copyWith(fontSize: 32);

  static const TextStyle boardgameTitleTextStyle = TextStyle(
    color: AppColors.greenDarker,
    fontSize: 18,
    fontFamily: AppFonts.headerFont,
  );

  static const TextStyle tileTypeTextStyle = TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.bodyFont,
    fontWeight: FontWeight.w700,
    color: AppColors.badgeText,
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
    color: AppColors.badgeTransparentText,
  );

  static const TextStyle markdownBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.bodyFont,
    fontSize: 18,
  );

  static const TextStyle markdownBody = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.bodyFont,
    fontSize: 18,
  );

  static const TextStyle menu = TextStyle(
    fontSize: 22,
    fontFamily: AppFonts.headerFont,
    color: AppColors.brown,
  );
}
