import 'package:charikati/controllers/buy_controller.dart';
import 'package:charikati/controllers/order_buy_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/models/order_buy.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BuyOrders extends StatelessWidget {
  BuyOrders({Key? key}) : super(key: key);
  final OrderBuyController orderController = Get.find<OrderBuyController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: orderController,
        builder: (_) {
          if (orderController.ordersLoading) {
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
          } else if (orderController.orderBuys.isEmpty) {
            return Center(
              child: Text("No Orders."),
            );
          } else {
            return ListView.builder(
              itemCount: orderController.orderBuys.length,
              itemBuilder: (context, index) {
                return OrderBuyTile(
                  order: orderController.orderBuys[index],
                );
              },
            );
          }
        });
  }
}

class OrderBuyTile extends StatelessWidget {
  final OrderBuy order;
  OrderBuyTile({
    Key? key,
    required this.order,
  }) : super(key: key);
  final ProductController productController = Get.find<ProductController>();
  final OrderBuyController orderController = Get.find<OrderBuyController>();
  final BuyController buyController = Get.find<BuyController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onLongPress: () {
            orderController.selectedOrderBuy = order;
            Get.defaultDialog(
              backgroundColor: kcbackground,
              title: "Supprimer",
              textCancel: "Cancel",
              cancelTextColor: Colors.grey,
              textConfirm: "Confirm",
              confirmTextColor: kcwhite,
              buttonColor: Colors.red,
              middleText: "Are you sure you want to delete this order?",
              onConfirm: () {
                orderController.selectedOrderBuy = order;
                orderController.deleteOrderBuy();

                buyController.updateBuy();
              },
              onCancel: () {
                orderController.selectedOrderBuy = null;
              },
            );
          },
          title: Text(order.product.name),
          subtitle: Text("${order.quantity} pcs"),
          trailing: Text("${order.total} DA"),
        ),
        Divider(),
      ],
    );
  }
}
