import 'package:charikati/components/buy_tile.dart';
import 'package:charikati/controllers/buy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuysList extends StatelessWidget {
  BuysList({Key? key}) : super(key: key);
  final BuyController buyController = Get.find<BuyController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: buyController,
      builder: (_) {
        return ListView.builder(

          itemCount: buyController.buys.length,
          itemBuilder: (context, index) {
            return BuyTile(buy: buyController.buys[index]);
          },
        );
      }
    );
  }
}
