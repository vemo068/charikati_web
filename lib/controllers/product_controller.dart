import 'package:charikati/models/product.dart';
import 'package:charikati/services/http_service.dart';
import 'package:charikati/styles/colors.dart';
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
    if (nameController.text.isEmpty ||
        sellPriceController.text.isEmpty ||
        buyPriceController.text.isEmpty) {
      Get.snackbar(
        "Erreur",
        "Veuillez remplir tous les champs",
        icon: Icon(
          Icons.error,
          color: Colors.red,
        ),
        backgroundColor: kcbackground,
        colorText: kcsecondary,
        borderColor: Colors.red,
        borderWidth: 1,
        borderRadius: 10,
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      );
    } else {
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
      buyPriceController.clear();
    }

    update();
  }

  Future<void> getAllProducts() async {
    products = await httpService.getProducts();
    update();
  }

  Future<void> deleteProduct() async {
    await httpService.deleteProduct(selectedProduct!.id!);
    Get.back();
    await getAllProducts();
    nameController.clear();
    sellPriceController.clear();
    buyPriceController.clear();
    update();
  }
}
