import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg1_24/theme/app_color.dart';
import 'package:pas_mobile_11pplg1_24/widget/button_widget.dart';

class ProfilePages extends StatelessWidget {
  ProfilePages({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 6,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/736x/37/19/68/37196824a5355d3a082629c024bb7e2b.jpg",
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "Muhammad Yazid Arsy",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primarydark,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "kamuyazidkan@gmail.com",
                  style: TextStyle(fontSize: 16, color: AppColor.primarydark),
                ),

                SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ButtonWidget(
                    text: "Logout",
                    backgroundcolor: AppColor.secondaryred,
                    textcolor: AppColor.neutrallight,
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: Text("Confirm Logout"),
                          content: Text("Kamu yakin ingin logout?"),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text("Tidak"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.logout();
                              },
                              child: Text("Iya"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
