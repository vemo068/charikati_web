import 'package:charikati/controllers/order_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/models/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellOrders extends StatelessWidget {
  SellOrders({Key? key}) : super(key: key);
  final OrderController orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: orderController,
        builder: (_) {
          if (orderController.orders.isEmpty) {
            return Center(
              child: Text("No Orders"),
            );
          } else {
            return ListView.builder(
              itemCount: orderController.orders.length,
              itemBuilder: (context, index) {
                return OrderTile(
                  order: orderController.orders[index],
                );
              },
            );
          }
        });
  }
}

class OrderTile extends StatelessWidget {
  final Order order;
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);
  final ProductController productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: FutureBuilder<String>(
          future: productController.getProductName(order.productId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox();
            } else {
              return Text(snapshot.data!);
            }
          }),
      subtitle: Text("${order.contity}"),
      trailing: Text("${order.total} DA"),
    );
  }
}
