import 'package:charikati/controllers/buy_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/models/order_buy.dart';
import 'package:charikati/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderBuyController extends GetxController {
  final HttpService httpService = HttpService();
  final BuyController buyController = Get.find<BuyController>();
  final ProductController productController = Get.find<ProductController>();
  List<OrderBuy> orderBuys = [];
  OrderBuy? selectedOrderBuy;

  int count = 1;
  TextEditingController quantityController = TextEditingController(text: "1");

  @override
  void onInit() async {
    await getOrderBuys();
    super.onInit();
  }

  getOrderBuys() async {
    var ob = await httpService.getBuyOrders(buyController.selectedBuy!.id!);
    if (ob != null) {
      orderBuys = ob;
    } else {
      orderBuys = [];
    }
    update();
  }

  void saveOrderBuy() async {
    OrderBuy orderBuy = OrderBuy(
      product: productController.selectedProduct!,
      quantity: int.parse(quantityController.text),
      buy: buyController.selectedBuy!,
      total: productController.selectedProduct!.price *
          int.parse(quantityController.text),
    );

    await httpService.insertOrderBuy(orderBuy);
    getOrderBuys();
    Get.back();
    count = 1;
    quantityController.text = "$count";
    buyController.updateBuy();
    await buyController.getForniBuys();
    productController.selectedProduct = null;
    await productController.getAllProducts();
    update();
  }

  deleteOrderBuy() async {
    await httpService.deleteOrderBuy(selectedOrderBuy!.id!);
    getOrderBuys();
    update();
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
