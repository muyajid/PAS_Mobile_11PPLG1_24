import 'dart:convert';

import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_24/database/db_helper.dart';
import 'package:pas_mobile_11pplg1_24/model/product_model.dart';
import 'package:pas_mobile_11pplg1_24/network/network_api.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_24/theme/app_color.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var productResponse = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduct();
    fetchMarkProduct();
  }

  void fetchProduct() async {
    final url = Uri.parse("${NetworkApi.BASE_URL_PRODUCT}/products");

    try {
      isLoading.value = true;

      final res = await http.get(url);

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final List productData = data;

        productResponse.assignAll(
          productData.map((e) => ProductModel.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar(
          "Informasi",
          "Gagal Mengambil Data",
          backgroundColor: AppColor.secondaryred,
          colorText: AppColor.neutrallight,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Informasi",
        e.toString(),
        backgroundColor: AppColor.secondaryred,
        colorText: AppColor.neutrallight,
      );
    } finally {
      isLoading.value = false;
    }
  }

  final db = DBHelper();
  void markFavoriteProduct(int i) async {
    final findProduct = productResponse[i];
    print("Data Product : ${findProduct}");

    await db.markProduct({
      'image': findProduct.image,
      'title': findProduct.title.toString(),
      'price': findProduct.price,
      'category': findProduct.category.toString(),
    });

    Get.snackbar(
      'Product Pages',
      'Product Berhasil Di Bookmark',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.secondarygreen,
      colorText: AppColor.neutrallight,
      duration: Duration(seconds: 1),
    );
    fetchMarkProduct();
  }

  var productMark = <ProductModel>[].obs;

  void fetchMarkProduct() async {
    final mapList = await db.getMarkProduct();

    final list = mapList.map((row) => ProductModel.fromDb(row)).toList();

    productMark.assignAll(list);

    print("Data Marked: $productMark");
  }

  void deleteMarkProduct(int i) async {
    final product = productMark[i];

    await db.deleteProduct(product.id);

    Get.snackbar(
      'Product Pages',
      'Product Berhasil Di Hapus',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.secondarygreen,
      colorText: AppColor.neutrallight,
      duration: Duration(seconds: 1),
    );

    fetchMarkProduct();
  }
}
