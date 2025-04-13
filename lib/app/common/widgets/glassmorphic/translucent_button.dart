import 'package:flutter/material.dart';
import 'translucent_panel.dart';

class TranslucentButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double width;
  final double height;
  final Color bgColor;
  final Color color;
  final double opacity;


  const TranslucentButton(
      {super.key,
      required this.onTap,
      required this.child,
      this.width = double.infinity,
      this.height = 60,
      this.bgColor = Colors.transparent,
      this.color = Colors.white,
      this.opacity = 0.3,
      });

  @override
  Widget build(BuildContext context) {
    return TranslucentPanel(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor.withValues(alpha: opacity),
          foregroundColor: color,
          elevation: 2,
          minimumSize: Size(double.infinity, double.infinity),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: child,
      ),
    );
  }
}
