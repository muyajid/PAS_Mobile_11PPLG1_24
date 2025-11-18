import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/controller/bottom_nav_controller.dart';
import 'package:pas_mobile_11pplg1_24/theme/app_color.dart';

class BottomNavPages extends StatelessWidget {
  BottomNavPages({super.key});
  final controller = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.title[controller.currentIndex.value],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primaryblue,
            ),
          ),
          backgroundColor: AppColor.neutrallight,
          automaticallyImplyLeading: true,
          elevation: 2,
          centerTitle: true,
        ),
        body: controller.pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.neutrallight,
          elevation: 4,
          onTap: controller.changeIndex,
          selectedItemColor: AppColor.primarydark,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag, color: AppColor.primarydark),
              label: "Product",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, color: AppColor.primarydark),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: AppColor.primarydark),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
