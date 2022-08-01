import 'package:charikati/controllers/forni_controller.dart';
import 'package:charikati/models/forni.dart';
import 'package:charikati/pages/forni_page.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForniCard extends StatelessWidget {
  final Forni forni;
  ForniCard({Key? key, required this.forni}) : super(key: key);
  final ForniController forniController = Get.find<ForniController>();
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 2,
      child: ListTile(
        onTap: () {
          forniController.selectedForni = forni;
          Get.to(() => ForniPage());
        },
        minVerticalPadding: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: kcwhite,
        leading: Icon(
          Icons.person,
        ),
        title: Text(
          forni.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
