import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pronunciation_checker/app/common/widgets/nav_button.dart';
import 'package:getx_pronunciation_checker/app/routes/app_pages.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        spacing: 20,
        children: [
          SizedBox(height: 100,),
          NavButton(
            route: Routes.PRONUNCIATION_CHECKER,
            label: 'PRONUNCIATION_CHECKER',
          ),
          NavButton(
            route: Routes.WALKTHRU,
            label: 'WALKTHRU',
          ),
           NavButton(
            route: Routes.SHARE,
            label: 'SHARE',
          ),
           NavButton(
            route: Routes.LOTTIE,
            label: 'LOTTIE',
          ),
        ],
      )),
    );
  }
}
