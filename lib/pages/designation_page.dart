import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/controllers/designation_controller.dart';
import 'package:charikati/models/designation.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DesignationPage extends StatelessWidget {
  DesignationPage({Key? key}) : super(key: key);
  final DesignationController designationController =
      Get.put(DesignationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
        appBar: charikatiAppBar("Designations"),
        floatingActionButton: FabAjoute(ontap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  color: kcwhite,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        controller: designationController.nameController,
                      ),
                      MaterialButton(
                          color: kcaccent,
                          onPressed: () {
                            designationController.saveDesignation();
                          })
                    ],
                  ),
                );
              });
        }),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:GetBuilder(
                  init: designationController,
                  builder: (_) {
                    return ListView.builder(
                      itemCount: designationController.designations.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Text(
                              designationController.designations[index].name),
                        );
                      }),
                    );
                  })),
        ));
  }
}





