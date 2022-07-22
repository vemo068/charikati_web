import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({Key? key, required this.product}) : super(key: key);
  final ProductController productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        productController.selectedProduct = product;
        Get.dialog(
          AlertDialog(
            title: Text("Delete Product"),
            content: Text("Are you sure you want to delete this product?"),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Get.back();
                },
              ),
              TextButton(
                child: Text("Delete"),
                onPressed: () {
                  productController.deleteProduct();
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
      trailing: Text("${product.price} DA"),
      title: Text(product.name),
      subtitle: Text("${product.stock} pieces"),
    );
  }
}
