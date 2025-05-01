import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'test_controller.dart';

class TestView extends GetView<TestController> {
  const TestView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              '',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
