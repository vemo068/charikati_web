import 'package:charikati/components/add_orderbuy_button.dart';
import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/buy_orders.dart';
import 'package:charikati/controllers/buy_controller.dart';
import 'package:charikati/controllers/forni_controller.dart';
import 'package:charikati/controllers/order_buy_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyPage extends StatelessWidget {
  BuyPage({Key? key}) : super(key: key);
  final ForniController forniController = Get.find<ForniController>();
  final BuyController buyController = Get.find<BuyController>();
  final ProductController productController = Get.put(ProductController());
  final OrderBuyController orderController = Get.put(OrderBuyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: AppBar(
       
        title: Text("Buy Page"),
        foregroundColor: kcwhite,
        backgroundColor: kcmain,
        elevation: 0,
      ),
      body: Column(
        children: [
          BuyInfoBox(),
          SizedBox(height: 20),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                // SellOrders(),
                BuyOrders(),
          )),
          AddOrderBuyButton()
        ],
      ),
    );
  }
}

class BuyInfoBox extends StatelessWidget {
  BuyInfoBox({Key? key}) : super(key: key);
  final ForniController forniController = Get.find<ForniController>();
  final BuyController buyController = Get.find<BuyController>();
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
                forniController.selectedForni!.name,
                style: mediHeading3Style.copyWith(color: kcwhite),
              )),
              Expanded(
                child: Text(buyController.selectedBuy!.date.toString(),
                    style: mediHeading3Style.copyWith(color: kcwhite)),
              ),
            ],
          ),
          SizedBox(height: 20),
          GetBuilder(
              init: buyController,
              builder: (_) {
                return Text("${buyController.selectedBuy!.total} DA",
                    style: mediHeading2Style.copyWith(color: kcaccent));
              }),
        ],
      ),
    );
  }
}
