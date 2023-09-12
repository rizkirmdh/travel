// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppTextLarge extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  AppTextLarge({
    Key? key,
    this.size = 30,
    required this.text,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.bold,
        ));
  }
}
