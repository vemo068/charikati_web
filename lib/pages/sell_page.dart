import 'package:charikati/components/add_order_button.dart';
import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/components/sell_orders.dart';
import 'package:charikati/controllers/order_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellPage extends StatelessWidget {
  SellPage({Key? key}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  final SellController sellController = Get.find<SellController>();
  final ProductController productController = Get.put(ProductController());
  final OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: AppBar(
        actions: [IconButton(onPressed: sellController.printSell, icon: Icon(Icons.file_copy),),],
    title: Text("Sell Page"),
    foregroundColor: kcwhite,
    backgroundColor: kcmain,
    elevation: 0,
  ),
      body: Column(
        children: [
          SellInfoBox(),
          SizedBox(height: 20),
          Expanded(child: SellOrders()),
          AddOrderButton()
        ],
      ),
    );
  }
}

class SellInfoBox extends StatelessWidget {
  SellInfoBox({Key? key}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  final SellController sellController = Get.find<SellController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcmain,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                clientController.selectedClient!.name,
                style: mediHeading3Style.copyWith(color: kcwhite),
              )),
              Expanded(
                child: Text(sellController.selectedSell!.date.toString(),
                    style: mediHeading3Style.copyWith(color: kcwhite)),
              ),
            ],
          ),
          SizedBox(height: 20),
          GetBuilder(
            init: sellController,
            builder: (_) {
              return Text("${sellController.selectedSell!.total} DA",
                  style: mediHeading2Style.copyWith(color: kcaccent));
            }
          ),
        ],
      ),
    );
  }
}
