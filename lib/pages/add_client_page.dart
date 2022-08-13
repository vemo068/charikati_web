// ignore_for_file: prefer_const_constructors

import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/ch_text_field.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/components/wide_button.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddClientPage extends StatelessWidget {
  final bool isEdit;
  AddClientPage({Key? key, required this.isEdit}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: charikatiAppBar("Add Client"),
      body: NormalPadding(
        child: Center(
          child: ListView(shrinkWrap: true, children: [
            Center(
              child: Text(
                "Obligatoire info",
                style: mediHeading1Style,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TxtField(
                hint: "Client name",
                controller: clientController.nameController),
            SizedBox(height: 20),
            TxtField(
                hint: "Client Nif", controller: clientController.nifController),
            SizedBox(height: 20),
            TxtField(
                hint: "Client Rcn", controller: clientController.rcnController),
            SizedBox(height: 40),
            Center(
              child: Text(
                "Informations facultatives",
                style: mediHeading1Style,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TxtField(
                hint: "Client phone",
                controller: clientController.phoneController),
            SizedBox(height: 20),
            WideButton(
                text: isEdit ? "Sauvgarder" : "Ajouter",
                onPressed: clientController.saveClient,
                color: kcsecondary),
            SizedBox(
              height: 20,
            ),
            isEdit
                ? WideButton(
                    text: "Supprimer",
                    onPressed: clientController.deleteClient,
                    color: Colors.red)
                : SizedBox(),
          ]),
        ),
      ),
    );
  }
}
