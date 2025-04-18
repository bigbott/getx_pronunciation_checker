import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/widgets/glassmorphic/translucent_icon_button.dart';
import 'package:getx_pronunciation_checker/app/common/widgets/glassmorphic/translucent_text_field.dart';
import 'package:getx_pronunciation_checker/app/modules/walkthru/walkthru_controller.dart';
import 'package:showcaseview/showcaseview.dart';

final class PlayText extends GetView<WalkthruController> {
  final Color? color;
  final double? height;
  final double? fontSize;
  final GlobalKey showcaseKey1;
  final GlobalKey showcaseKey2;

  const PlayText({
    super.key,
    this.color,
    this.fontSize,
    this.height,
    required this.showcaseKey1,
    required this.showcaseKey2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: Showcase(
            key: showcaseKey1,
            description: 'Enter the text you want to check pronunciation.',
            overlayOpacity: 0,
            disableMovingAnimation: true,
            textColor: Colors.white,
            descTextStyle: TextStyle(fontSize: 20, color: Colors.white),
            tooltipBackgroundColor: Colors.amber.shade900,
            descriptionTextAlign: TextAlign.center,
            child: TranslucentTextField(
              controller: controller.textController,
              color: color,
              fontSize: fontSize,
              height: height ?? 40,
            ),
          ),
        ),
        Showcase(
          key: showcaseKey2,
          description: 'Tap play button to play the correct pronunciation',
          overlayOpacity: 0,
          disableMovingAnimation: true,
          textColor: Colors.white,
          tooltipBackgroundColor: Colors.amber.shade900,
          descTextStyle: TextStyle(fontSize: 20, color: Colors.white),
          descriptionTextAlign: TextAlign.center,
          child: TranslucentIconButton(
            onPressed: controller.playText,
            icon: Icons.play_arrow,
            size: height ?? 40,
          ),
        )
      ],
    );
  }
}
