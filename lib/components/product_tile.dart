import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/pages/add_product_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({Key? key, required this.product}) : super(key: key);
  final ProductController productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onLongPress: () {
            productController.selectedProduct = product;
            Get.to((() => AddProductPage(isEdit: true)));
          },
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(12),
            child: Column(children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        style: mediBodyStyle.copyWith(color: Colors.black),
                      ),
                    ),
                    Text("${product.stock} pcs"),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  color: kcaccent,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${product.buyPrice} DA",
                          style:
                              mediSubheadingStyle.copyWith(color: Colors.red),
                        ),
                        Text(
                          "Prix d'achat",
                          style: mediCaptionStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${product.sellPrice} DA",
                          style:
                              mediSubheadingStyle.copyWith(color: Colors.green),
                        ),
                        Text(
                          "Prix de vente",
                          style: mediCaptionStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

// function
//  productController.selectedProduct = product;
        // Get.to((() => AddProductPage(isEdit: true)));

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