import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/buys_list.dart';
import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/controllers/buy_controller.dart';
import 'package:charikati/controllers/forni_controller.dart';
import 'package:charikati/pages/add_forni_page.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForniPage extends StatelessWidget {
  ForniPage({Key? key}) : super(key: key);
  final ForniController _forniController = Get.find<ForniController>();
  final BuyController _buyController = Get.put(BuyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabAjoute(
        text: "Ajouter un Buy",
        ontap: () {
          _buyController.saveBuy();
        },
      ),
      appBar: charikatiAppBar("fournisseur", actions: [
        IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _forniController.initFields();
              Get.to(() => AddForniPage(
                    isEdit: true,
                  ));
            })
      ]),
      body: NormalPadding(
        child: Column(
          children: [
            GetBuilder(
                init: _forniController,
                builder: (_) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_forniController.selectedForni!.name,
                            style: mediHeadlineStyle),
                        Text(
                          "Buys history",
                          style: mediHeading3Style,
                        ),
                      ],
                    ),
                  );
                }),
            Expanded(
              child: BuysList(),
            )
          ],
        ),
      ),
    );
  }
}
