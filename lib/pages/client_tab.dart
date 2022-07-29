import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/clients_list.dart';
import 'package:charikati/components/drawer.dart';
import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/pages/add_client_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ClientsTab extends StatelessWidget {
  const ClientsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      floatingActionButton: FabAjoute(
        text: "Ajouter un client",
        ontap: () {
          Get.to(() => AddClientPage());
        },
      ),
    
      drawer: SettingDrawer(),
      body: NormalPadding(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Mes Clients",
            style: mediHeadlineStyle,
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(child: ClientsList()),
        ],
      )),
    );
  }
}
