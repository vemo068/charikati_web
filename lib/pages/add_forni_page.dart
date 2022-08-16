import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/components/wide_button.dart';
import 'package:charikati/controllers/forni_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddForniPage extends StatelessWidget {
  final bool isEdit;
  AddForniPage({Key? key,required this.isEdit}) : super(key: key);
  final ForniController _forniController = Get.find<ForniController>();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: charikatiAppBar("Ajouter un fournisseur"),
      body: NormalPadding(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Les information de fournisseur",
            style: mediHeadlineStyle,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _forniController.nameController,
            decoration: InputDecoration(
              labelText: "Nom du fournisseur",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _forniController.phoneController,
            decoration: InputDecoration(
              labelText: "Numéro de téléphone",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
         WideButton(text:isEdit?"Sauvgarder": "Ajouter", onPressed: _forniController.saveForni, color: kcsecondary),
         SizedBox(
          height: 20,
         ),
        isEdit? WideButton(text:"Supprimer", onPressed: _forniController.deleteForni, color: Colors.red):SizedBox(),
        ],
      )),
    );
  }
}
