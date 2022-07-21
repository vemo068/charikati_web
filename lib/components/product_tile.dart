import 'package:charikati/controllers/designation_controller.dart';
import 'package:charikati/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({Key? key, required this.product}) : super(key: key);
  final DesignationController designationController =
      Get.find<DesignationController>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text("${product.price}"),
      title: Text(product.name),
      subtitle: FutureBuilder<String>(
          future:
              designationController.getDesigntaionName(product.designationId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox();
            } else {
              return Text(snapshot.data!);
            }
          }),
    );
  }
}
