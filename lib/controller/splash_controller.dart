import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    Future.delayed(Duration(seconds: 10));
    final pref = await SharedPreferences.getInstance();

    final token = pref.getString("token");

    if (token != null) {
      Get.offAllNamed(AppRouter.bottomNav);
    } else {
      Get.offAllNamed(AppRouter.loginPages);
    }
  }
}
