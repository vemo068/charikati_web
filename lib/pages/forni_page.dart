import 'package:charikati/components/appbar.dart';
import 'package:charikati/controllers/forni_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ForniPage extends StatelessWidget {
   ForniPage({ Key? key }) : super(key: key);
final ForniController _forniController = Get.find<ForniController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:charikatiAppBar("fournisseur"),
      body: Column(
        children: [
          Text("fournisseur"),
        ],
      ),
      
    );
  }
}