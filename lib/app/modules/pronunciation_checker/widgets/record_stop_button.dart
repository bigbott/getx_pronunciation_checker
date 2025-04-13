import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/widgets/glassmorphic/translucent_icon_button.dart';
import 'package:getx_pronunciation_checker/app/modules/pronunciation_checker/pronunciation_checker_controller.dart';

final class RecordStopButton extends GetView<PronunciationCheckerController> {

  final double? size;

  const RecordStopButton({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PronunciationCheckerController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!controller.isRecording)
              TranslucentIconButton(
                icon: Icons.mic,
                size: size ?? 50,
                onPressed: controller.startRecording,
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
