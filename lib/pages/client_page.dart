import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/client_sells.dart';
import 'package:charikati/components/client_info_box.dart';
import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/pages/add_client_page.dart';
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
        text: "Ajouter un vente",
        ontap: () {
          sellController.saveSell();
        },
      ),
      appBar: charikatiAppBar("Client Info", actions: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            clientController.initFields();
            Get.to(() => AddClientPage(
                  isEdit: true,
                ));
          },
        ),
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(color: kcbackground, child: ClientInfoBox()),
          // SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: kcbackground,
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              "Sells History",
              style: mediHeadlineStyle,
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: ClientSells()),
        ],
      ),
    );
  }
}
