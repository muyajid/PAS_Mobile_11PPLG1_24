import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/pages/bookmark_pages.dart';
import 'package:pas_mobile_11pplg1_24/pages/product_pages.dart';
import 'package:pas_mobile_11pplg1_24/pages/profile_pages.dart';

class BottomNavController extends GetxController {
  final currentIndex = 0.obs;
  final pages = [ProductPages(), BookmarkPages(), ProfilePages()];
  final title = ["Product Pages", "Bookmark Pages", "Profile Pages"];
  void changeIndex(int i) => currentIndex.value = i;
}
