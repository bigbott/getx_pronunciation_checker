import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/extensions/text.dart';
import 'package:getx_pronunciation_checker/app/modules/pronunciation_checker/pronunciation_checker_controller.dart';

final class FeedbackBuilder extends GetView<PronunciationCheckerController> {
  final double? fontSize;
  const FeedbackBuilder({super.key, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PronunciationCheckerController>(
      id: 'feedback',
      builder: (_) => Text(controller.feedback).withStyle(
        fontSize: fontSize ?? 40,
        color:
            controller.feedback == 'Excellent' ? 
            Colors.green.shade100 : Colors.red.shade100,
      ),
    );
  }
}
