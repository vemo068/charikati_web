import 'dart:convert';

import 'package:charikati/models/product.dart';
import 'package:charikati/services/http_service.dart';
import 'package:charikati/services/links.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ProductController extends GetxController {
  final HttpService httpService = HttpService();

  List<Product> products = [];
  Product? selectedProduct;
  TextEditingController nameController = TextEditingController();
  TextEditingController sellPriceController = TextEditingController();
  TextEditingController buyPriceController = TextEditingController();
  bool loadingProducts = false;
  final sController = ScrollController();
  @override
  void onInit() {
    getAllProducts();
    sController.addListener(() {
      if (sController.position.maxScrollExtent == sController.offset) {
        loadMore();
      }
    });
    super.onInit();
  }

  initFields() {
    nameController.text = selectedProduct!.name;
    sellPriceController.text = selectedProduct!.sellPrice.toString();
    buyPriceController.text = selectedProduct!.buyPrice.toString();
  }

  Future<void> saveProduct(bool isEdit) async {
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
      Get.defaultDialog(
        title: isEdit ? "Saving changes" : "Adding Product..",
        middleText: "",
        content: CircularProgressIndicator(),
        barrierDismissible: false,
      );
      await httpService.insertProduct(product);
      Get.back();
      Get.back();
      await getAllProducts();
      selectedProduct = null;
      nameController.clear();
      sellPriceController.clear();
      buyPriceController.clear();
    }

    update();
  }

  Future<void> getAllProducts() async {
    isLastPage = false;
    page = 0;
    loadingProducts = true;
    update();
    products = await httpService.getProducts();
    loadingProducts = false;
    update();
  }

  Future<void> deleteProduct() async {
    Get.defaultDialog(
      title: "Deleting Product..",
      middleText: "",
      content: CircularProgressIndicator(),
      barrierDismissible: false,
    );
    await httpService.deleteProduct(selectedProduct!.id!);
    Get.back();
    Get.back();
    await getAllProducts();
    nameController.clear();
    sellPriceController.clear();
    buyPriceController.clear();
    update();
  }

  // PAGINATION //

  int page = 0;
  bool moreLoding = false;
  bool isLastPage = false;
  loadMore() async {
    if (isLastPage) {
    } else {
      moreLoding = true;
      var response = await get(Uri.parse(productsUrl + "?page=$page"));
      var jsonResponse = json.decode(response.body);
      List<Product> moreProducts = [];

      for (var p in jsonResponse["content"]) {
        moreProducts.add(Product.fromJson(p));
      }

      isLastPage = jsonResponse["last"];
      page++;
      products = products + moreProducts;
      moreLoding = false;
    }
    update();
  }
}
