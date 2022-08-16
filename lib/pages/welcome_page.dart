import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/controllers/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final WelcomeController welcomeController = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NormalPadding(
          child: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/charikati.png"),
            ),
          ),
        ),
      )),
    );
  }
}
