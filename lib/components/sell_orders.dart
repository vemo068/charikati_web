import 'package:charikati/controllers/order_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/models/order_sell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellOrders extends StatelessWidget {
  SellOrders({Key? key}) : super(key: key);
  final OrderSellController orderController = Get.find<OrderSellController>();
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
  final OrderSell order;
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);
  final ProductController productController = Get.find<ProductController>();
  final OrderSellController orderController = Get.find<OrderSellController>();
  final SellController sellController = Get.find<SellController>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Delete Order"),
                content: Text("Are you sure you want to delete this order?"),
                actions: <Widget>[
                  TextButton(
                    child: Text("Yes"),
                    onPressed: () {
                      orderController.selectedOrder = order;
                      orderController.deleteOrder();

                      Get.back();
                      sellController.updateSell();
                    },
                  ),
                  TextButton(
                    child: Text("No"),
                    onPressed: () {
                      Get.back();
                    },
                  )
                ],
              );
            });
      },
      title: Text(order.product.name),
      subtitle: Text("${order.quantity} pcs"),
      trailing: Text("${order.total} DA"),
    );
  }
}
