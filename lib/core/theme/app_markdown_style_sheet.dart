import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AppMarkdownStyleSheet {
  static MarkdownStyleSheet styleSheet = MarkdownStyleSheet(
    strong: AppTextStyles.markdownBold,
    p: AppTextStyles.markdownBody,
  );
}
