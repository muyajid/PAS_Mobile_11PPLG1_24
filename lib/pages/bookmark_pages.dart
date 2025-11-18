import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/controller/product_controller.dart';
import 'package:pas_mobile_11pplg1_24/theme/app_color.dart';

class BookmarkPages extends StatelessWidget {
  BookmarkPages({super.key});
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
                final product = controller.productMark[index];
                return Container(
                  decoration: BoxDecoration(
                    color: AppColor.neutrallight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.primaryblue),
                  ),
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  child: ListTile(
                    leading: Image.network(
                      product.image.toString(),
                      height: 50,
                      width: 50,
                    ),
                    title: Text(product.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(product.price.toString()),
                        SizedBox(height: 10),
                        Text(product.category.toString()),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        controller.markFavoriteProduct(index);
                      },
                      icon: Icon(Icons.delete),
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
