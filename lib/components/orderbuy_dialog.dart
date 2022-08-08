import 'package:charikati/components/choose_product.dart';
import 'package:charikati/components/order_quantity.dart';
import 'package:charikati/controllers/order_buy_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderBuyDialog extends StatelessWidget {
  OrderBuyDialog({Key? key}) : super(key: key);
  final ProductController productController = Get.find<ProductController>();
  final OrderBuyController orderController = Get.find<OrderBuyController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Order Details"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [ChooseProduct(isSell: false,), SizedBox(height: 20), OrderBuyQuantity()],
      ),
      actions: [
        TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.grey),
          ),
          onPressed: () {
            Get.back();
            productController.selectedProduct = null;
            orderController.count = 1;
            orderController.quantityController.text =
                "${orderController.count}";
            productController.selectedProduct = null;
          },
        ),
        TextButton(
          child: Text(
            "Order",
            style: TextStyle(color: kcmain),
          ),
          onPressed: () {
            orderController.saveOrderBuy();
          },
        ),
      ],
    );
  }
}
