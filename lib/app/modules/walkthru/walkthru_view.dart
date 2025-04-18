import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/extensions/text.dart';
import 'package:getx_pronunciation_checker/app/common/widgets/glassmorphic/gradient_background.dart';
import 'package:getx_pronunciation_checker/app/modules/walkthru/widgets/feedback_builder.dart';
import 'package:getx_pronunciation_checker/app/modules/walkthru/widgets/play_text.dart';
import 'package:getx_pronunciation_checker/app/modules/walkthru/widgets/pronounced_builder.dart';
import 'package:getx_pronunciation_checker/app/modules/walkthru/widgets/record_stop_button.dart';
import 'package:showcaseview/showcaseview.dart';

import 'walkthru_controller.dart';

class WalkthruView extends GetView<WalkthruController> {
  const WalkthruView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey infoKey = GlobalKey();
    GlobalKey key1 = GlobalKey();
    GlobalKey key2 = GlobalKey();
    GlobalKey key3 = GlobalKey();

    BuildContext? infoContext;
    BuildContext? walkthruContext;

    if (controller.firstTime) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => ShowCaseWidget.of(infoContext!).startShowCase([
               infoKey
              ]));
      controller.firstTime = false;
    }
    return GradientBackground(
      colors: [Colors.deepPurple.shade900, Colors.black, Colors.blue.shade900],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Pronunciation Checker'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white70,
          centerTitle: true,
          actions: [
            ShowCaseWidget(
              builder: (context) {
                infoContext = context;
                return Showcase(
                   key: infoKey,
                    description: 
                    'We would like to showcase the features of this page.'
                    'Tap the Info icon to start the walkthrouh.',
                    overlayOpacity: 0,
                    disableMovingAnimation: true,
                    tooltipBackgroundColor: Colors.amber.shade900,
                    descTextStyle: TextStyle(fontSize: 20, color: Colors.white),
                    descriptionTextAlign: TextAlign.center,
                  child: IconButton(
                    onPressed: () {
                      ShowCaseWidget.of(walkthruContext!).startShowCase([
                        key1,
                        key2,
                        key3,
                      ]);
                    },
                    icon: Icon(Icons.info_outline_rounded, size: 30,),
                  ),
                );
              }
            ),
          ],
        ),
        body: ShowCaseWidget(
            autoPlay: true,
            builder: (context) {
            walkthruContext = context; 

              return Center(
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
                        showcaseKey1: key1,
                        showcaseKey2: key2,
                      ),
                      SizedBox(height: 50),
                      Text('Tap mic button to start recording:')
                          .withStyle(color: Colors.white70, fontSize: 18),
                      SizedBox(height: 20),
                      RecordStopButton(
                        size: 50,
                        showcaseKey1: key3,
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
              );
            }),
      ),
    );
  }
}
