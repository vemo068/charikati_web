import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseProduct extends StatelessWidget {
  ChooseProduct({Key? key}) : super(key: key);
  final ProductController productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: productController,
        builder: (_) {
          return DropdownButtonHideUnderline(
              child: DropdownButton<Product?>(
            value: productController.selectedProduct,
            icon: Icon(Icons.shopping_cart),
            hint: Text("Select Product"),
            items: productController.products.map((Product des) {
              return DropdownMenuItem<Product?>(
                value: des,
                child: Text(des.name),
              );
            }).toList(),
            onChanged: (Product? value) {
              productController.selectedProduct = value;
              print(productController.selectedProduct!.name);
              productController.update();
            },
          ));
        });
  }
}
