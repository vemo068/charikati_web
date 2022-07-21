import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/choose_designation.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({Key? key}) : super(key: key);
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
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
                controller: productController.priceController,
                decoration: InputDecoration(
                  labelText: "Product Price",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ChooseDesignation(),
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                color: kcaccent,
                onPressed: () {
                  productController.saveProduct();
                },
              )
            ]),
          )),
    );
  }
}
