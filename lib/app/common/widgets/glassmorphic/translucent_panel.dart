import 'package:flutter/material.dart';

final class TranslucentPanel extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Widget? child;

  const TranslucentPanel(
      {super.key,
      // this.width = double.infinity,
      // this.height = double.infinity,
       this.width = 0,
      this.height = 0,
      this.borderRadius = 12,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white70,
          Colors.white,
          Colors.white70,
        ]).withOpacity(0.15),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Center(child: child),
    );
  }
}
