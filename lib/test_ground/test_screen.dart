import 'package:book/test_ground/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MyHome(),
    );
  }
}
