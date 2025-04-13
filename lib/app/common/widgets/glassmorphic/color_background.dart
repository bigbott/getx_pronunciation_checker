import 'package:flutter/material.dart';

final class ColorBackground extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double opacity;
  final Widget? child;

  const ColorBackground(
      {super.key,
      this.width = double.infinity,
      this.height = double.infinity,
      required this.color,
      this.opacity = 1,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color.withValues(alpha: opacity),
      child: child,
    );
  }
}
