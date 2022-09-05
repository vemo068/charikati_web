import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/pages/sell_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellTile extends StatelessWidget {
  final Sell sell;
  SellTile({Key? key, required this.sell}) : super(key: key);
  final SellController sellsController = Get.find<SellController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // onLongPress: () {
        //   sellsController.selectedSell = sell;
        //   Get.defaultDialog(
        //     backgroundColor: kcbackground,
        //     title: "Supprimer",
        //     textCancel: "Cancel",
        //     cancelTextColor: Colors.grey,
        //     textConfirm: "Confirm",
        //     confirmTextColor: kcwhite,
        //     buttonColor: Colors.red,
        //     middleText: "Are you dure you want delete the sell of ${sell.date}",
        //     onConfirm: () {
        //       sellsController.deleteSell();
        //     },
        //     onCancel: () {
        //       sellsController.selectedSell = null;
        //     },
        //   );
        // },
        onTap: (() {
          sellsController.selectedSell = sell;
          Get.to(() => SellPage());
        }),
        tileColor: kcaccent.withOpacity(0.6),
        leading: Icon(Icons.shopping_cart),
        title: Text("${sell.date}"),
        subtitle: Text(sell.total.toString() + " DA"),
      ),
    );
  }
}
