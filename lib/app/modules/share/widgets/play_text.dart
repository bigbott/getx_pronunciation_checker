import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/widgets/glassmorphic/translucent_icon_button.dart';
import 'package:getx_pronunciation_checker/app/common/widgets/glassmorphic/translucent_text_field.dart';
import 'package:getx_pronunciation_checker/app/modules/share/share_controller.dart';

final class PlayText extends GetView<ShareController> {

  final Color? color;
  final double? height;
  final double? fontSize;

  const PlayText({super.key, this.color, this.fontSize, this.height});
  

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: TranslucentTextField(
            controller: controller.textController,
            color: color,
            fontSize: fontSize,
            height: height ?? 40,
          ),
        ),
        TranslucentIconButton(
          onPressed: controller.playText,
          icon: Icons.play_arrow,
          size: height ?? 40,
        )
      ],
    );
  }
}
