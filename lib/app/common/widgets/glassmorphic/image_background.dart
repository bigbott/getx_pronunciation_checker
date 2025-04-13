import 'dart:ui';
import 'package:flutter/material.dart';

final class ImageBackground extends StatelessWidget {
  final double width;
  final double height;
  final ImageProvider<Object> image;
  final double opacity;
  final Widget? child;
  final double blur;

  const ImageBackground(
      {super.key,
      this.width = double.infinity,
      this.height = double.infinity,
      required this.image,
      this.opacity = 1,
      this.blur = 0,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
          opacity: opacity,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child,
      ),
    );
  }
}
