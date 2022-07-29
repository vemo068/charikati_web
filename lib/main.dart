import 'package:charikati/controllers/home_controller.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  

  
  runApp( CharikatyApp());
}

class CharikatyApp extends StatelessWidget {
   CharikatyApp({Key? key}) : super(key: key);
final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
