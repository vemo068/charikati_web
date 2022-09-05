import 'package:charikati/components/forni_card.dart';
import 'package:charikati/controllers/forni_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForniList extends StatelessWidget {
  ForniList({Key? key}) : super(key: key);
  final ForniController forniController = Get.find<ForniController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: forniController,
        builder: (_) {
          if (forniController.loadingFornis) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Loading..."),
                ],
              ),
            );
          } else if (forniController.fornis.isNotEmpty) {
            return ListView.builder(
              itemCount: forniController.fornis.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ForniCard(forni: forniController.fornis[index]),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: Text("no fornisseurs."),
            );
          }
        });
  }
}
