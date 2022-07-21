import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/pages/sell_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellTile extends StatelessWidget {
  final Sell sell;
  SellTile({Key? key, required this.sell}) : super(key: key);
  final SellController sellsController = Get.find<SellController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: (() {
          sellsController.selectedSell = sell;
          Get.to(() => SellPage());
        }),
        tileColor: Colors.red.withOpacity(0.2),
        leading: Icon(Icons.shopping_cart),
        title: Text("${sell.date}"),
        subtitle: Text(sell.total.toString() + " DA"),
      ),
    );
  }
}
