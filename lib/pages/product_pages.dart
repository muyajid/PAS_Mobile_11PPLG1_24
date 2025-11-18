import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/controller/product_controller.dart';
import 'package:pas_mobile_11pplg1_24/widget/product_item_widget.dart';

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
                return ProductItemWidget(
                  image: product.image,
                  title: product.title,
                  price: "\$ ${product.price}",
                  category: product.category.toString(),
                  text: "Bookmark",
                  onFavoriteTap: () {
                    controller.markFavoriteProduct(index);
                  },
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
