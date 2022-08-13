import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/components/wide_button.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  final bool isEdit;
  AddProductPage({Key? key, required this.isEdit}) : super(key: key);
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    isEdit ? productController.initFields() : null;
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: charikatiAppBar("Add Product"),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: ListView(shrinkWrap: true, children: [
              TextField(
                controller: productController.nameController,
                decoration: InputDecoration(
                  labelText: "Product name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: productController.sellPriceController,
                decoration: InputDecoration(
                  labelText: "Sell Price (DA)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: productController.buyPriceController,
                decoration: InputDecoration(
                  labelText: "Buy Price (DA)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              WideButton(
                text: isEdit ? "Sauvgarder" : "Ajouter",
                onPressed: () {
                  productController.saveProduct();
                },
                color: kcsecondary,
              ),
              SizedBox(
                height: 20,
              ),
              isEdit
                  ? WideButton(
                      text: "Supprimer",
                      onPressed: () {
                        
                        productController.deleteProduct();
                      },
                      color: Colors.red,
                    )
                  : SizedBox(),
            ]),
          )),
    );
  }
}
