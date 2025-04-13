import 'package:flutter/material.dart';
import 'translucent_panel.dart';

class TranslucentTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color bgColor;
  final Color? color;
  final double opacity;
  final double borderRadius;
  final double width;
  final double height;
  final TextStyle? style;
  final double? fontSize;

  const TranslucentTextField({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.bgColor = Colors.transparent,
    this.color = Colors.white,
    this.opacity = 0.3,
    this.borderRadius = 12,
    this.width = double.infinity,
    this.height = 40,
     this.style,
     this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TranslucentPanel(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              style: style ?? TextStyle(color: color, 
               fontSize: fontSize,),
              cursorColor: color,
              decoration: InputDecoration(
                filled: true,
                fillColor: bgColor.withValues(alpha: opacity),
                hintText: hintText,
                prefixIcon: prefixIcon != null
                    ? IconTheme(data: IconThemeData(color: color), child: prefixIcon!)
                    : null,
                suffixIcon: suffixIcon != null
                    ? IconTheme(data: IconThemeData(color: color), child: suffixIcon!)
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                      color: Colors.grey,
                      strokeAlign: BorderSide.strokeAlignInside,
                      width: 1,
                      style: BorderStyle.solid),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
