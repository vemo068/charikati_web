import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/components/fornis_list.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/controllers/forni_controller.dart';
import 'package:charikati/models/forni.dart';
import 'package:charikati/pages/add_forni_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FornisTab extends StatelessWidget {
  FornisTab({Key? key}) : super(key: key);
  final ForniController forniController = Get.find<ForniController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      floatingActionButton: FabAjoute(
        text: "Ajouter un fournisseur",
        ontap: () {
          Get.to(() => AddForniPage(isEdit: false,));
        },
      ),
      body: NormalPadding(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Mes Fournisseurs",
            style: mediHeadlineStyle,
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(child: ForniList()),
        ],
      )),
    );
  }
}
