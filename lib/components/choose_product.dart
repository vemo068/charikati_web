import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseProduct extends StatelessWidget {
  final bool isSell;
  ChooseProduct({Key? key, required this.isSell}) : super(key: key);
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(des.name),
                    Text("${des.stock} left",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 12)),
                  ],
                ),
                //  ListTile(
                //   title: Text(des.name),
                //   subtitle: Text("${des.stock} left"),
                // ),
              );
            }).toList(),
            onChanged: (Product? value) {
              if (value!.stock > 0 || !isSell) {
                productController.selectedProduct = value;
                print(productController.selectedProduct!.name);
                productController.update();
              } else {
                Get.snackbar("Error", "Product is out of stock",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    borderRadius: 10,
                    margin: EdgeInsets.all(10),
                    borderColor: Colors.red,
                    borderWidth: 2,
                    colorText: Colors.white,
                    icon: Icon(Icons.error, color: Colors.white));
              }
            },
          ));
        });
  }
}
