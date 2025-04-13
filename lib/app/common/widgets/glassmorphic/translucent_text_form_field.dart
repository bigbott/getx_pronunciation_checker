import 'package:flutter/material.dart';
import 'translucent_panel.dart';

class TranslucentTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Color bgColor;
  final Color color;
  final double opacity;

  const TranslucentTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.bgColor = Colors.transparent,
    this.color = Colors.white,
    this.opacity = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return TranslucentPanel(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        style: TextStyle(color: color),
        decoration: InputDecoration(
          filled: true,
          fillColor: bgColor.withOpacity(opacity),
          hintText: hintText,
          labelText: labelText,
          hintStyle: TextStyle(color: color.withOpacity(0.7)),
          labelStyle: TextStyle(color: color),
          prefixIcon: prefixIcon != null 
              ? IconTheme(data: IconThemeData(color: color), child: prefixIcon!)
              : null,
          suffixIcon: suffixIcon != null 
              ? IconTheme(data: IconThemeData(color: color), child: suffixIcon!)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
