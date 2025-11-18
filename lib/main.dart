import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pas_mobile_11pplg1_24/router/app_pages.dart';
import 'package:pas_mobile_11pplg1_24/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRouter.splashpages,
      getPages: AppPages.pages,
    );
  }
}
