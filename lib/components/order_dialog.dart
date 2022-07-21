import 'package:charikati/components/choose_product.dart';
import 'package:charikati/components/order_quantity.dart';
import 'package:charikati/controllers/order_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDialog extends StatelessWidget {
  OrderDialog({Key? key}) : super(key: key);
  final ProductController productController = Get.find<ProductController>();
  final OrderController orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Order Details"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [ChooseProduct(), SizedBox(height: 20), OrderQuantity()],
      ),
      actions: [
        TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.grey),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text(
            "Order",
            style: TextStyle(color: kcmain),
          ),
          onPressed: () {
            orderController.saveOrder();
          },
        ),
      ],
    );
  }
}
