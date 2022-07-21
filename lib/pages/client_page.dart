import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/client_sells.dart';
import 'package:charikati/components/client_info_box.dart';
import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientPage extends StatelessWidget {
  ClientPage({Key? key}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  final SellController sellController = Get.put(SellController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      floatingActionButton: FabAjoute(
        ontap: () {
          sellController.saveSell();
        },
      ),
      appBar: charikatiAppBar("Client Info"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClientInfoBox(),
          SizedBox(height: 20),
          Text(
            "Buys History",
            style: mediHeadlineStyle,
          ),
          SizedBox(height: 10),
          Expanded(child: ClientSells()),
        ],
      ),
    );
  }
}
