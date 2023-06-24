import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/components/product_tile.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/pages/add_product_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: charikatiAppBar("Produits"),
      floatingActionButton: FabAjoute(
          text: "Ajouter un produit",
          ontap: () {
            Get.to(() => AddProductPage(
                  isEdit: false,
                ));
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GetBuilder(
            init: productController,
            builder: (_) {
              if (productController.loadingProducts) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Loading..."),
                    ],
                  ),
                );
              } else if (productController.products.isNotEmpty) {
                return ListView.builder(
                    controller: productController.sController,
                    itemCount: productController.products.length + 1,
                    itemBuilder: (context, index) {
                      if (index < productController.products.length) {
                        return ProductTile(
                          product: productController.products[index],
                        );
                      } else if (!productController.isLastPage) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(
                            child: Text(
                              "La fin de list",
                              style: mediSubheadingStyle,
                            ),
                          ),
                        );
                      }
                    });
              } else {
                return Center(
                  child: Text("No products."),
                );
              }
            }),
      ),
    );
  }
}
