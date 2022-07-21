import 'package:charikati/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  

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
        name: nameController.text,
        price: int.parse(priceController.text),
        );
   // db.insertProduct(product);
    getAllProducts();
    Get.back();
    nameController.clear();
    priceController.clear();
   
    update();
  }

  Future<void> getAllProducts() async {
   // products = await db.getProducts();
    update();
  }

}
