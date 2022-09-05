import 'package:charikati/components/sell_tile.dart';
import 'package:charikati/controllers/sell_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientSells extends StatelessWidget {
  ClientSells({Key? key}) : super(key: key);
  final SellController sellssController = Get.find<SellController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: sellssController,
        builder: (_) {
          if (sellssController.loadingSells) {
            return Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Loading...")
                ],
              ),
            );
          } else if (sellssController.sells.isEmpty) {
            return Center(
              child: Text("No Buys"),
            );
          } else {
            return ListView.builder(
              itemCount: sellssController.sells.length,
              itemBuilder: (context, index) {
                return SellTile(
                  sell: sellssController.sells[index],
                );
              },
            );
          }
        });
  }
}
