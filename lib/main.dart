import 'package:charikati/controllers/home_controller.dart';
import 'package:charikati/controllers/login_controller.dart';
import 'package:charikati/controllers/welcome_controller.dart';
import 'package:charikati/pages/home.dart';

import 'package:charikati/pages/login_page.dart';
import 'package:charikati/pages/welcome_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(CharikatyApp());
}

class CharikatyApp extends StatelessWidget {
  CharikatyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

// initialRoute: '/',
// getPages: [
//   GetPage(name: '/', page: () => WelcomePage()),
//   GetPage(name: '/home', page: () => HomePage()),
//   GetPage(name: '/login', page: () => LoginPage()),
// ],

var listOfYears = [
  '2022',
  '2023',
  '2024',
  '2025',
  '2026',
  '2027',
  '2028',
  '2029',
  '2030',
  '2031',
  '2032',
  '2033',
  '2034',


];
var listOfMonths = [
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12',
  
];
