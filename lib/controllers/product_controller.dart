import 'package:charikati/models/product.dart';
import 'package:charikati/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final HttpService httpService = HttpService();

  List<Product> products = [];
  Product? selectedProduct;
  TextEditingController nameController = TextEditingController();
  TextEditingController sellPriceController = TextEditingController();
  TextEditingController buyPriceController = TextEditingController();

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  initFields() {
    nameController.text = selectedProduct!.name;
    sellPriceController.text = selectedProduct!.sellPrice.toString();
    buyPriceController.text = selectedProduct!.buyPrice.toString();
  }

  Future<void> saveProduct() async {
    Product product = Product(
      id: selectedProduct != null ? selectedProduct!.id : null,
      stock: 0,
      name: nameController.text,
      sellPrice: int.parse(sellPriceController.text),
      buyPrice: int.parse(buyPriceController.text),
    );
    await httpService.insertProduct(product);
    await getAllProducts();
    Get.back();
    nameController.clear();
    sellPriceController.clear();

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
