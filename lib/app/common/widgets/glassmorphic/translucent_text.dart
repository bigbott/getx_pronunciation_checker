import 'package:flutter/material.dart';
import 'translucent_panel.dart';

class TranslucentText extends StatelessWidget {
  final Color bgColor;
  final Color color;
  final double opacity;
  final double borderRadius;
  final double spreadRadius;
  final double fontSize;
  final String text;
  final double alignmentY;
  final double alignmentX;

  const TranslucentText({
    super.key,
    required this.text,
    this.bgColor = Colors.transparent,
    this.color = Colors.white,
    this.opacity = 0.3,
    this.borderRadius = 8,
    this.fontSize = 14,
    this.spreadRadius = 5, 
    this.alignmentY = -1,
    this.alignmentX = 0,
  });

  @override
  Widget build(BuildContext context) {
    return TranslucentPanel(
      width: text.length * fontSize/2 + spreadRadius * 2,
      height: fontSize + spreadRadius * 2,
      borderRadius: borderRadius,
      child: Align(
        alignment: Alignment(alignmentX, alignmentY),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
          ),
        ),
      ),
    );
  }
}
