import 'package:cacao_boardgame_helper/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class RulePdfScreen extends StatelessWidget {
  const RulePdfScreen({super.key, required this.pdfPath, required this.title});
  final String title;
  final String pdfPath;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: title,
      showBackButton: true,
      body: SfPdfViewer.asset(pdfPath),
    );
  }
}
