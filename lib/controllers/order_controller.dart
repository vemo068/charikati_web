import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/models/order_sell.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSellController extends GetxController {
  final HttpService httpService = HttpService();

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
    var or = await httpService.getSellOrders(sellController.selectedSell!.id!);
    if (or != null) {
      orders = or;
    } else {
      orders = [];
    }
    update();
  }

  void saveOrder() async {
    int total = productController.selectedProduct!.sellPrice *
        int.parse(quantityController.text);
    OrderSell order = OrderSell(
        total: total,
        quantity: int.parse(quantityController.text),
        product: productController.selectedProduct!,
        sell: sellController.selectedSell!);

    await httpService.insertOrderSell(order);
    getSellOrders();
    Get.back();
    count = 1;
    quantityController.text = "$count";
    productController.selectedProduct = null;
    sellController.updateSell();
    await productController.getAllProducts();
    update();
  }

  void increaseCount() {
    if (count < productController.selectedProduct!.stock) {
      count++;
    } else {}
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

  deleteOrder() async {
    
    await httpService.deleteOrderSell(selectedOrder!.id!);
    sellController.updateSell();
    productController.selectedProduct = null;
    getSellOrders();
    await productController.getAllProducts();
    update();
  }
}
