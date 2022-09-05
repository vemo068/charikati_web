import 'package:charikati/controllers/buy_controller.dart';
import 'package:charikati/models/buy.dart';
import 'package:charikati/pages/buy_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyTile extends StatelessWidget {
  final Buy buy;
  BuyTile({Key? key, required this.buy}) : super(key: key);
  final BuyController buyController = Get.find<BuyController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onLongPress: () {
          buyController.selectedBuy = buy;
          Get.defaultDialog(
            backgroundColor: kcbackground,
            title: "Supprimer",
            textCancel: "Cancel",
            cancelTextColor: Colors.grey,
            textConfirm: "Confirm",
            confirmTextColor: kcwhite,
            buttonColor: Colors.red,
            middleText: "Are you dure you want delete the buy of ${buy.date}",
            onConfirm: () {
              buyController.deleteBuy();
            },
            onCancel: () {
             
              buyController.selectedBuy = null;
            },
          );
        },
        onTap: (() {
          buyController.selectedBuy = buy;
          Get.to(() => BuyPage());
        }),
        tileColor: Colors.blue.withOpacity(0.2),
        leading: Icon(Icons.shopping_cart),
        title: Text("${buy.date}"),
        subtitle: Text(buy.total.toString() + " DA"),
      ),
    );
  }
}
