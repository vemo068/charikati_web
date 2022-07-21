import 'package:avatars/avatars.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/models/client.dart';
import 'package:charikati/pages/client_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientCard extends StatelessWidget {
  final Client client;
  ClientCard({Key? key, required this.client}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(8),
      child: ListTile(
        //tileColor: kcbackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onTap: () {
          clientController.selectedClient = client;
          Get.to(() => ClientPage());
        },
        leading: Hero(
          tag: client.id!,
          child: SizedBox(
            height: 50,
            width: 50,
            child: Avatar(
              textStyle: mediButtonStyle,
              elevation: 2,
              name: client.name,
            ),
          ),
        ),
        title: Text(client.name),
        subtitle: Text(client.phone),
        trailing: Text(client.email),
      ),
    );
  }
}
