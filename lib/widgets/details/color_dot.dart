import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  final Color fillColor;
  final bool isSelected;

  const ColorDot({
    Key? key,
    required this.fillColor,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? fillColor : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: fillColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
