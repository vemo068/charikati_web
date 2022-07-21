import 'package:charikati/controllers/designation_controller.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final DatabaseService db = DatabaseService();

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
    final DesignationController designationController =
        Get.find<DesignationController>();
    Product product = Product(
        name: nameController.text,
        price: int.parse(priceController.text),
        designationId: designationController.selectedDesignation!.id!);
    db.insertProduct(product);
    getAllProducts();
    Get.back();
    nameController.clear();
    priceController.clear();
    designationController.selectedDesignation = null;
    update();
  }

  Future<void> getAllProducts() async {
    products = await db.getProducts();
    update();
  }

  Future<String> getProductName(int productId) async {
    var product = await db.product(productId);
    return product.name;
  }
}
