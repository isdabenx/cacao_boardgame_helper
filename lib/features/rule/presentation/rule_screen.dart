import 'package:cacao_boardgame_helper/config/constants/assets.dart';
import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/core/theme/app_text_styles.dart';
import 'package:cacao_boardgame_helper/features/rule/presentation/rule_pdf_screen.dart';
import 'package:cacao_boardgame_helper/shared/widgets/container_full_style_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class RuleScreen extends StatelessWidget {
  const RuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Rules',
      body: ContainerFullStyleWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RulePdfScreen(
                        title: 'Instructions',
                        pdfPath: 'assets/rules/rulesEN.pdf'),
                  ),
                );
              },
              child: Card(
                color: AppColors.greenNormal,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(Assets.boardgameCacao),
                        radius: 30,
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Instructions",
                        style:
                            AppTextStyles.titleTextStyle.copyWith(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RulePdfScreen(
                        title: 'Instructions',
                        pdfPath: 'assets/rules/overviewTilesEN.pdf'),
                  ),
                );
              },
              child: Card(
                color: AppColors.greenNormal,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(Assets.boardgameCacao),
                        radius: 30,
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Overview",
                        style:
                            AppTextStyles.titleTextStyle.copyWith(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
