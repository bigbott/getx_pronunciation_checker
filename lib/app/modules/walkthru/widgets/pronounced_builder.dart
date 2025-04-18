import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/extensions/text.dart';
import 'package:getx_pronunciation_checker/app/modules/walkthru/walkthru_controller.dart';

final class PronouncedBuilder extends GetView<WalkthruController> {
  final double? fontSize1;
  final double? fontSize2;

  const PronouncedBuilder({super.key, this.fontSize1, this.fontSize2});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalkthruController>(
        builder: (_) => Visibility(
            visible: controller.result.isNotEmpty,
            child: Column(
              children: [
                Text('You pronounced: ').withStyle(
                  fontSize: fontSize1 ?? 18,
                  color: Colors.white70,
                ),
                Text(controller.result).withStyle(
                  fontSize: fontSize2 ?? 20,
                  color: Colors.white,
                ),
              ],
            )));
  }
}
