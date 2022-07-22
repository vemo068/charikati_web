import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/models/order.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/models/sell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final SellController sellController = Get.find<SellController>();
  final ProductController productController = Get.find<ProductController>();
  final ClientController clientController = Get.find<ClientController>();
  List<OrderSell> orders = [];
  OrderSell? selectedOrder;

  int count = 1;
  TextEditingController quantityController = TextEditingController(text: "1");

  @override
  void onInit() {
    getSellOrders();
    super.onInit();
  }

  void inis() {}

  void getSellOrders() async {
    // var or = await db.getBuyOrders(sellController.selectedSell!.id!);
    // if (or != null) {
    //   orders = or;
    // } else {
    //   orders = [];
    // }
    update();
  }

  void saveOrder() async {
    int total = productController.selectedProduct!.price *
        int.parse(quantityController.text);
    OrderSell order = OrderSell(
        total: total,
        contity: int.parse(quantityController.text),
        product: productController.selectedProduct!,
        sell: sellController.selectedSell!);
    updateSell();
    // await db.insertOrder(order);
    getSellOrders();
    Get.back();
    count = 1;
    quantityController.text = "$count";
    update();
  }

  updateSell() async {
    int total = productController.selectedProduct!.price *
        int.parse(quantityController.text);
    Sell sell = Sell(
      client: clientController.selectedClient!,
      date: sellController.selectedSell!.date,
      total: sellController.selectedSell!.total! + total,
    );
    // await db.updateSell(sell, sellController.selectedSell!.id!);
    // sellController.selectedSell =
    //     await db.sell(sellController.selectedSell!.id!);
    sellController.getClientBuys();
  }

  void increaseCount() {
    count++;
    quantityController.text = count.toString();
    update();
  }

  void decreaseCount() {
    if (count > 1) {
      count--;
    } else {}

    quantityController.text = count.toString();
    update();
  }
}
