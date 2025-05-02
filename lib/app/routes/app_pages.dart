import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/lottie/lottie_binding.dart';
import '../modules/lottie/lottie_view.dart';
import '../modules/pronunciation_checker/pronunciation_checker_binding.dart';
import '../modules/pronunciation_checker/pronunciation_checker_view.dart';
import '../modules/share/share_binding.dart';
import '../modules/share/share_view.dart';
import '../modules/test/test_binding.dart';
import '../modules/test/test_view.dart';
import '../modules/walkthru/walkthru_binding.dart';
import '../modules/walkthru/walkthru_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
    GetPage(
      name: _Paths.WALKTHRU,
      page: () => const WalkthruView(),
      binding: WalkthruBinding(),
    ),
    GetPage(
      name: _Paths.TEST,
      page: () => const TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: _Paths.SHARE,
      page: () => const ShareView(),
      binding: ShareBinding(),
    ),
    GetPage(
      name: _Paths.LOTTIE,
      page: () => const LottieView(),
      binding: LottieBinding(),
    ),
  ];
}
