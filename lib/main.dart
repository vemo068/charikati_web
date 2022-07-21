import 'package:charikati/models/designation.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  

  
  runApp(const CharikatyApp());
}

class CharikatyApp extends StatelessWidget {
  const CharikatyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
