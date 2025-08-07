import 'package:flutter/material.dart';

class CustomProgressInd extends StatelessWidget {
  final double size;
  final Color? color;

  const CustomProgressInd({
    super.key,
    this.size = 40.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = color ?? Theme.of(context).primaryColor;

    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: 3.5,
        valueColor: AlwaysStoppedAnimation<Color>(themeColor),
      ),
    );
  }
}
