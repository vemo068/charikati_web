import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/controllers/forni_controller.dart';
import 'package:charikati/models/forni.dart';
import 'package:charikati/pages/add_forni_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForniTab extends StatelessWidget {
  ForniTab({Key? key}) : super(key: key);
  final ForniController forniController = Get.find<ForniController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      floatingActionButton: FabAjoute(
        text: "Ajouter un fournisseur",
        ontap: () {
          Get.to(() => AddForniPage());
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

class ForniList extends StatelessWidget {
  ForniList({Key? key}) : super(key: key);
  final ForniController forniController = Get.find<ForniController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: forniController,
        builder: (_) {
          return GridView.builder(
            itemCount: forniController.fornis.length,
            itemBuilder: (context, index) {
              return ForniCard(forni: forniController.fornis[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
          );
        });
  }
}

class ForniCard extends StatelessWidget {
  final Forni forni;
  const ForniCard({Key? key, required this.forni}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kcsecondary,
    );
  }
}
