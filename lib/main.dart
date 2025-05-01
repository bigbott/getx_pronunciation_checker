import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/extensions/device_previewing.dart';
import 'package:getx_pronunciation_checker/app/data/storage_service.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/share_service.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/speech_recognition_service.dart';
import 'package:getx_pronunciation_checker/app/infrastructure/tts_service.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put<IStorageService>(StorageService(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBinging(),
    ).withDevicePreview(true),
  );
}

class InitialBinging extends Bindings {
  @override
  void dependencies() {
   
    Get.lazyPut<ITtsService>(
      () => TtsService(),
    );
    Get.lazyPut<ISpeechRecognitionService>(
      () => SpeechRecognitionService(),
    );
    Get.lazyPut<IShareService>(
      () => ShareService(),
    );
  }
}
