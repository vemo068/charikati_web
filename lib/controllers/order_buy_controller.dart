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

  bool ordersLoading = false;
  getOrderBuys() async {
    ordersLoading = true;
    update();
    var ob = await httpService.getBuyOrders(buyController.selectedBuy!.id!);
    if (ob != null) {
      orderBuys = ob;
    } else {
      orderBuys = [];
    }
    ordersLoading = false;
    update();
  }

  void saveOrderBuy() async {
    OrderBuy orderBuy = OrderBuy(
      product: productController.selectedProduct!,
      quantity: int.parse(quantityController.text),
      buy: buyController.selectedBuy!,
      total: productController.selectedProduct!.buyPrice *
          int.parse(quantityController.text),
    );
    Get.defaultDialog(
      title: "Adding order..",
      middleText: "",
      content: CircularProgressIndicator(),
      barrierDismissible: false,
    );
    await httpService.insertOrderBuy(orderBuy);
    getOrderBuys();
    Get.back();
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
    Get.defaultDialog(
      title: "Deleting Order..",
      middleText: "",
      content: CircularProgressIndicator(),
      barrierDismissible: false,
    );
    await httpService.deleteOrderBuy(selectedOrderBuy!.id!);
    buyController.updateBuy();
    productController.selectedProduct = null;
    getOrderBuys();
    await productController.getAllProducts();
    Get.back();
    Get.back();
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
