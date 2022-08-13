import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/pages/add_product_page.dart';
import 'package:charikati/styles/styles.dart';
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
        Get.to((() => AddProductPage(isEdit: true)));
      },
      // trailing: Text("${product.price} DA"),
      title: Text(product.name),
      trailing: Text("${product.stock} pieces"),
      subtitle: Row(
        children: [
          Icon(
            Icons.arrow_drop_down,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              formatCurrency.format(product.buyPrice) + " DA",
              style: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.arrow_drop_up,
            color: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              formatCurrency.format(product.sellPrice) + " DA",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}


 // Get.dialog(
        //   AlertDialog(
        //     title: Text("Delete Product"),
        //     content: Text("Are you sure you want to delete this product?"),
        //     actions: [
        //       TextButton(
        //         child: Text("Cancel"),
        //         onPressed: () {
        //           Get.back();
        //         },
        //       ),
        //       TextButton(
        //         child: Text("Delete"),
        //         onPressed: () {
        //           productController.deleteProduct();
        //           Get.back();
        //         },
        //       ),
        //     ],
        //   ),
        // );