import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/controller/product_controller.dart';
import 'package:pas_mobile_11pplg1_24/theme/app_color.dart';

class ProductPages extends StatelessWidget {
  ProductPages({super.key});
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = controller.productResponse[index];
                return Container(
                  decoration: BoxDecoration(
                    color: AppColor.neutrallight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.primaryblue),
                  ),
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  child: ListTile(
                    leading: Image.network(
                      product.image,
                      height: 50,
                      width: 50,
                    ),
                    title: Text(
                      product.title,
                      style: TextStyle(
                        color: AppColor.primarydark,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Rp.${product.price.toString()}",
                          style: TextStyle(fontWeight: FontWeight.w200),
                        ),
                        SizedBox(height: 10),
                        Text(
                          product.category.toString(),
                          style: TextStyle(
                            color: AppColor.primarydark,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        controller.markFavoriteProduct(index);
                      },
                      icon: Icon(Icons.bookmark),
                    ),
                  ),
                );
              },
              itemCount: controller.productResponse.length,
            ),
            onRefresh: () async {
              controller.fetchProduct();
            },
          );
        }),
      ),
    );
  }
}
