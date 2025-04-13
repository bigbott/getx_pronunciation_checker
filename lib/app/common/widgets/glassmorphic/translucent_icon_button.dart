import 'package:flutter/material.dart';
import 'translucent_panel.dart';

class TranslucentIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  final Color bgColor;
  final Color color;
  final double opacity;
  final double borderRadius;

  const TranslucentIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size = 48,
    this.bgColor = Colors.transparent,
    this.color = Colors.white,
    this.opacity = 0.3,
    this.borderRadius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return TranslucentPanel(
      width: size,
      height: size,
      borderRadius: borderRadius,
      // child: IconButton(
      //   color: bgColor,
      //   iconSize: size - 20,
      //   onPressed: onPressed,
      //   icon: Icon(icon, color: color),

      //   style: IconButton.styleFrom(
      //     backgroundColor: bgColor == Colors.transparent ? bgColor : bgColor.withValues(alpha: opacity),//bgColor.withValues(alpha: opacity),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(borderRadius),
      //     ),

      //   ),
      // ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor.withValues(alpha: opacity),
          foregroundColor: color,
          elevation: 2,
          minimumSize: Size(double.infinity, double.infinity),
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Icon(icon, color: color),
      ),
    );
  }
}
