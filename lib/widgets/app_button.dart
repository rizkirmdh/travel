import 'package:flutter/material.dart';
import 'package:travel/misc/colors.dart';

import 'app_text_normal.dart';

class AppButton extends StatelessWidget {

  final Color color;
  final Color backgroundColor;
  final double width;
  final double height;
  String? text;
  IconData? icon;
  Color? borderColor;
  bool? isIcon;

  AppButton({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.width,
    required this.height,
    this.borderColor,
    this.icon,
    this.text,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: isIcon == true ?
            Center(child: Icon(icon, color: color, size: 22,))
          : Center(child: AppTextNormal(text: text!, color: color, size: 22,)),
    );
  }
}
