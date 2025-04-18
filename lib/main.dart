import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/extensions/device_previewing.dart';
import 'package:getx_pronunciation_checker/app/data/storage_service.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put<IStorageService>(StorageService(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ).withDevicePreview(true),
  );
}
