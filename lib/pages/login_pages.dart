import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg1_24/router/app_router.dart';
import 'package:pas_mobile_11pplg1_24/theme/app_color.dart';
import 'package:pas_mobile_11pplg1_24/widget/button_widget.dart';
import 'package:pas_mobile_11pplg1_24/widget/textfields_widget.dart';

class LoginPages extends StatelessWidget {
  LoginPages({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Login Pages",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15),
                TextfieldsWidget(
                  label: "Username",
                  prefixIcon: Icon(Icons.person),
                  controller: controller.username,
                ),
                SizedBox(height: 15),
                TextfieldsWidget(
                  label: "Password",
                  prefixIcon: Icon(Icons.password),
                  obscureText: true,
                  controller: controller.password,
                ),
                SizedBox(height: 20),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : ButtonWidget(
                          text: "Login",
                          textcolor: AppColor.neutrallight,
                          backgroundcolor: AppColor.primaryblue,
                          onPressed: () {
                            controller.login();
                          },
                        ),
                ),
                SizedBox(height: 15),
                ButtonWidget(
                  text: "Daftar",
                  textcolor: AppColor.primaryblue,
                  backgroundcolor: AppColor.neutrallight,
                  onPressed: () {
                    Get.toNamed(AppRouter.registerPages);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
