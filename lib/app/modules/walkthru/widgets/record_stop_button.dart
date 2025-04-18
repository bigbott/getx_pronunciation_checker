import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/widgets/glassmorphic/translucent_icon_button.dart';
import 'package:getx_pronunciation_checker/app/modules/walkthru/walkthru_controller.dart';
import 'package:showcaseview/showcaseview.dart';

final class RecordStopButton extends GetView<WalkthruController> {
  final double? size;
  final GlobalKey showcaseKey1;

  const RecordStopButton({
    super.key,
    this.size,
    required this.showcaseKey1,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalkthruController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!controller.isRecording)
              Showcase(
                key: showcaseKey1,
                description: 'Tap to start recording',
                overlayOpacity: 0,
                disableMovingAnimation: true,
                tooltipBackgroundColor: Colors.amber.shade900,
                descTextStyle: TextStyle(fontSize: 20, color: Colors.white),
                descriptionTextAlign: TextAlign.center,
                child: TranslucentIconButton(
                  icon: Icons.mic,
                  size: size ?? 50,
                  onPressed: controller.startRecording,
                ),
              ),
            if (controller.isRecording)
              TranslucentIconButton(
                icon: Icons.stop,
                size: size ?? 50,
                onPressed: controller.stopRecording,
              ),
          ],
        );
      },
    );
  }
}
