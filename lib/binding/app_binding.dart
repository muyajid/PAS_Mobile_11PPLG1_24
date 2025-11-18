import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg1_24/controller/bottom_nav_controller.dart';
import 'package:pas_mobile_11pplg1_24/controller/product_controller.dart';
import 'package:pas_mobile_11pplg1_24/controller/splash_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
