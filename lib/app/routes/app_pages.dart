import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/pronunciation_checker/pronunciation_checker_binding.dart';
import '../modules/pronunciation_checker/pronunciation_checker_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRONUNCIATION_CHECKER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRONUNCIATION_CHECKER,
      page: () => const PronunciationCheckerView(),
      binding: PronunciationCheckerBinding(),
    ),
  ];
}
