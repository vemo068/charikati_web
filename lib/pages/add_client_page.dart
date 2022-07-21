// ignore_for_file: prefer_const_constructors

import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/ch_text_field.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddClientPage extends StatelessWidget {
  AddClientPage({Key? key}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      appBar: charikatiAppBar("Add Client"),
      body: NormalPadding(
        child: Center(
          child: ListView(shrinkWrap: true, children: [
            TxtField(
                hint: "Client name",
                controller: clientController.nameController),
            SizedBox(height: 20),
            TxtField(
                hint: "Client phone",
                controller: clientController.phoneController),
            SizedBox(height: 20),
            TxtField(
                hint: "Client email",
                controller: clientController.emailController),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                clientController.saveClient();
              },
              child: Text("Add Client"),
              color: kcsecondary,
            )
          ]),
        ),
      ),
    );
  }
}
