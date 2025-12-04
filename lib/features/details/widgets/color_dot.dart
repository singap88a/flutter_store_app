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
    return GestureDetector(
      onTap: () {
        // Handle color selection
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(2.5),
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? fillColor : Colors.transparent,
            width: isSelected ? 2 : 0,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: fillColor.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 2),
            )
          ] : [],
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: fillColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
