import 'dart:ui';
import 'package:flutter/material.dart';

final class GradientBackground extends StatelessWidget {
  final double width;
  final double height;
  final List<Color> colors;
  final double opacity;
  final Widget? child;
  final GradientType gradientType; //circular, linear, sweep
  final GradientDirection gradientDirection;
  final Gradient? gradient;
  final double blur;

  const GradientBackground({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    required this.colors,
    this.opacity = 1.0,
    this.child,
    this.gradientType = GradientType.linear,
    this.gradientDirection = GradientDirection.diagonal,
    this.gradient,
    this.blur = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient ?? _createGradient(),
        ),
        child: _checkBlur());
  }

  Widget? _checkBlur() {
    if (blur != 0) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child,
      );
    }
    return child;
  }

  Gradient _createGradient() {
    switch (gradientType) {
      case GradientType.radial:
        return RadialGradient(colors: colors).withOpacity(opacity);
      case GradientType.sweep:
        return SweepGradient(colors: colors).withOpacity(opacity);

      default:
        return LinearGradient(colors: colors, begin: _chooseBegin(), end: _chooseEnd())
            .withOpacity(opacity);
    }
  }

  _chooseBegin() {
    switch (gradientDirection) {
      case GradientDirection.vertical:
        return Alignment.topCenter;
      case GradientDirection.horisontal:
        return Alignment.centerLeft;

      default:
        return Alignment.topLeft;
    }
  }

  _chooseEnd() {
    switch (gradientDirection) {
      case GradientDirection.vertical:
        return Alignment.bottomCenter;
      case GradientDirection.horisontal:
        return Alignment.centerRight;

      default:
        return Alignment.bottomRight;
    }
  }
}

enum GradientType { linear, radial, sweep }

enum GradientDirection { diagonal, vertical, horisontal }
