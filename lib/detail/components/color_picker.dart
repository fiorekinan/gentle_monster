import 'package:flutter/material.dart';
import 'package:gentle_monster_app/utils/const.dart';

class ColorPicker extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorPicker({super.key, required this.color, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultPadding,
        right: defaultPadding
      ),
      padding: EdgeInsets.all(1.5),
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent
        )
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
          ),
      ),
    );
  }
}