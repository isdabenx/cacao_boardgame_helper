import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PlayerRowWidget extends StatefulWidget {
  const PlayerRowWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  State<PlayerRowWidget> createState() => _PlayerRowWidgetState();
}

class _PlayerRowWidgetState extends State<PlayerRowWidget> {
  bool _isSelected = false;

  void _onTogglePlayer() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: _onTogglePlayer,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
              border: Border.all(
                color: _isSelected ? AppColors.brown : AppColors.greenNormal,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Visibility(
            visible: _isSelected,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Player Name',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
