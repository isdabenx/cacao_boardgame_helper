import 'package:flutter/material.dart';

class SelectExpansionWidget extends StatefulWidget {
  const SelectExpansionWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  State<SelectExpansionWidget> createState() => _SelectExpansionWidgetState();
}

class _SelectExpansionWidgetState extends State<SelectExpansionWidget> {
  bool _isSelected = false;

  void _onToggleExpansion() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onToggleExpansion,
      child: Container(
        width: 80,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.transparent,
            width: 2.0,
          ),
          image: DecorationImage(
            image: AssetImage(widget.image),
            fit: BoxFit.cover,
            colorFilter: _isSelected
                ? null
                : ColorFilter.mode(Colors.grey, BlendMode.saturation),
          ),
        ),
      ),
    );
  }
}
