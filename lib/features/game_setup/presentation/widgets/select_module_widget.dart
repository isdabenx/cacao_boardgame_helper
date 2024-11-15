import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SelectModuleWidget extends StatefulWidget {
  const SelectModuleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SelectModuleWidget> createState() => _SelectModuleWidgetState();
}

class _SelectModuleWidgetState extends State<SelectModuleWidget> {
  bool _isSelected = false;

  void _onToggleModule() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.brown,
              backgroundColor:
                  _isSelected ? AppColors.greenDark : AppColors.greenNormal,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: _onToggleModule,
            child: Text(widget.title),
          ),
        ),
      ],
    );
  }
}
