import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/components/product_tile.dart';
import 'package:charikati/controllers/designation_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/pages/add_product_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);
  final DesignationController designationController =
      Get.put(DesignationController());
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: charikatiAppBar("Produits"),
      floatingActionButton: FabAjoute(ontap: () {
        Get.to(() => AddProductPage());
      }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GetBuilder(
            init: productController,
            builder: (_) {
              return ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      product: productController.products[index],
                    );
                  });
            }),
      ),
    );
  }
}
