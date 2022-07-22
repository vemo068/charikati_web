import 'package:charikati/models/product.dart';
import 'package:charikati/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final HttpService httpService = HttpService();

  List<Product> products = [];
  Product? selectedProduct;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  Future<void> saveProduct() async {
    Product product = Product(
      stock: 0,
      name: nameController.text,
      price: int.parse(priceController.text),
    );
    await httpService.insertProduct(product);
    await getAllProducts();
    Get.back();
    nameController.clear();
    priceController.clear();

    update();
  }

  Future<void> getAllProducts() async {
    products = await httpService.getProducts();
    update();
  }

  Future<void> deleteProduct() async {
   await httpService.deleteProduct(selectedProduct!.id!);
    await getAllProducts();
    update();
  }
}
