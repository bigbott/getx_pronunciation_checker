import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/extensions/text.dart';
import 'package:getx_pronunciation_checker/app/common/widgets/glassmorphic/gradient_background.dart';
import 'package:getx_pronunciation_checker/app/modules/share/widgets/feedback_builder.dart';
import 'package:getx_pronunciation_checker/app/modules/share/widgets/play_text.dart';
import 'package:getx_pronunciation_checker/app/modules/share/widgets/pronounced_builder.dart';
import 'package:getx_pronunciation_checker/app/modules/share/widgets/record_stop_button.dart';

import 'share_controller.dart';

class ShareView extends GetView<ShareController> {
  const ShareView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      colors: [Colors.deepPurple.shade900, Colors.black, Colors.blue.shade900],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Pronunciation Checker'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white70,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text('Enter text to check pronunciation: ')
                    .withStyle(color: Colors.white70, fontSize: 18),
                SizedBox(
                  height: 10,
                ),
                PlayText(
                  color: Colors.white,
                  fontSize: 18,
                ),
                SizedBox(height: 50),
                Text('Tap mic button to start recording:')
                    .withStyle(color: Colors.white70, fontSize: 18),
                SizedBox(height: 20),
                RecordStopButton(
                  size: 50,
                ),
                SizedBox(height: 20),
                PronouncedBuilder(),
                SizedBox(height: 20),
                FeedbackBuilder(
                  fontSize: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
