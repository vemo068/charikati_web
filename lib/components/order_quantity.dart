import 'package:charikati/controllers/order_buy_controller.dart';
import 'package:charikati/controllers/order_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderQuantity extends StatelessWidget {
  OrderQuantity({Key? key}) : super(key: key);
  final OrderSellController orderController = Get.find<OrderSellController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: orderController,
        builder: (_) {
          return Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kcaccent,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    orderController.decreaseCount();
                  },
                  child: Icon(
                    Icons.exposure_minus_1,
                    color: kcsecondary,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  enabled: false,
                  controller: orderController.quantityController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kcsecondary,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    orderController.increaseCount();
                  },
                  child: Icon(
                    Icons.exposure_plus_1,
                    color: kcaccent,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class OrderBuyQuantity extends StatelessWidget {
  OrderBuyQuantity({Key? key}) : super(key: key);
  final OrderBuyController orderBuyController = Get.find<OrderBuyController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: orderBuyController,
        builder: (_) {
          return Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kcaccent,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    orderBuyController.decreaseCount();
                  },
                  child: Icon(
                    Icons.exposure_minus_1,
                    color: kcsecondary,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  enabled: false,
                  controller: orderBuyController.quantityController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kcsecondary,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    orderBuyController.increaseCount();
                  },
                  child: Icon(
                    Icons.exposure_plus_1,
                    color: kcaccent,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
