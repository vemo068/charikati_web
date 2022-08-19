import 'package:charikati/controllers/stats_controller.dart';
import 'package:charikati/pages/products_page.dart';
import 'package:charikati/pages/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingDrawer extends StatelessWidget {
  const SettingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
            child: Image.asset(
          "assets/charikati.png",
          fit: BoxFit.cover,
        )),
        ListTile(
          onTap: () {
            Get.to(() => ProductsPage());
          },
          leading: Icon(Icons.category),
          title: Text("Produits"),
        ),
        ListTile(
          onTap: () {
           
           
            Get.to(() => StatsPage());
          },
          leading: Icon(Icons.auto_graph),
          title: Text("Stats"),
        ),
      ]),
    );
  }
}
