import 'package:charikati/components/appbar.dart';

import 'package:charikati/components/drawer.dart';

import 'package:charikati/controllers/home_controller.dart';

import 'package:charikati/pages/clients_tab.dart';
import 'package:charikati/pages/fornis_tab.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
                FornisTab(),
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
              ],
            );
          }),
    );
  }
}
