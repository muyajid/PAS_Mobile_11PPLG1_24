import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas_mobile_11pplg1_24/binding/app_binding.dart';
import 'package:pas_mobile_11pplg1_24/pages/bookmark_pages.dart';
import 'package:pas_mobile_11pplg1_24/pages/bottom_nav_pages.dart';
import 'package:pas_mobile_11pplg1_24/pages/login_pages.dart';
import 'package:pas_mobile_11pplg1_24/pages/product_pages.dart';
import 'package:pas_mobile_11pplg1_24/pages/profile_pages.dart';
import 'package:pas_mobile_11pplg1_24/pages/register_pages.dart';
import 'package:pas_mobile_11pplg1_24/pages/splash_pages.dart';
import 'package:pas_mobile_11pplg1_24/router/app_router.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRouter.loginPages,
      page: () => LoginPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.registerPages,
      page: () => RegisterPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.splashpages,
      page: () => SplashPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.bottomNav,
      page: () => BottomNavPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.productPages,
      page: () => ProductPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.bookmarkPages,
      page: () => BookmarkPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouter.profilePages,
      page: () => ProfilePages(),
      binding: AppBinding(),
    ),
  ];
}
