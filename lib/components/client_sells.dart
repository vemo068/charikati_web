import 'package:charikati/components/sell_tile.dart';
import 'package:charikati/controllers/sell_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientSells extends StatelessWidget {
  ClientSells({Key? key}) : super(key: key);
  final SellController buysController = Get.find<SellController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: buysController,
        builder: (_) {
          if (buysController.sells.isEmpty) {
            return Center(
              child: Text("No Buys"),
            );
          } else {
            return ListView.builder(
              itemCount: buysController.sells.length,
              itemBuilder: (context, index) {
                return SellTile(
                  sell: buysController.sells[index],
                );
              },
            );
          }
        });
  }
}
