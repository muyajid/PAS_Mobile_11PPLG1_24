import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/controller/splash_controller.dart';

class SplashPages extends StatelessWidget {
  SplashPages({super.key});
  final controller = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Loading...",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
