import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/clients_list.dart';
import 'package:charikati/components/drawer.dart';
import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/controllers/forni_controller.dart';
import 'package:charikati/controllers/home_controller.dart';
import 'package:charikati/controllers/product_controller.dart';
import 'package:charikati/pages/add_client_page.dart';
import 'package:charikati/pages/client_tab.dart';
import 'package:charikati/pages/forni_page.dart';
import 'package:charikati/pages/stats_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ClientController clientController = Get.put(ClientController());
  final ForniController forniController = Get.put(ForniController());
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SettingDrawer(),
      appBar: charikatiAppBar("Home"),
      body: GetBuilder(
          init: homeController,
          builder: (_) {
            return IndexedStack(
              index: homeController.tabIndex,
              children: [
                ClientsTab(),
                ForniTab(),
                StatsTab(),
              ],
            );
          }),
      bottomNavigationBar: GetBuilder(
          init: homeController,
          builder: (_) {
            return BottomNavigationBar(
              onTap: homeController.changeTabIndex,
              currentIndex: homeController.tabIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_circle_up),
                  label: 'Sells',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_circle_down),
                  label: 'Buys',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.auto_graph),
                  label: 'Stats',
                ),
              ],
            );
          }),
    );
  }
}
