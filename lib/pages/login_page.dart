import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/ch_text_field.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/components/wide_button.dart';
import 'package:charikati/controllers/home_controller.dart';
import 'package:charikati/controllers/login_controller.dart';
import 'package:charikati/controllers/welcome_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
   final LoginController loginController = Get.put(LoginController());
 
  final WelcomeController welcomeController = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: charikatiAppBar("Login"),
      backgroundColor: kcbackground,
      body: NormalPadding(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TxtField(
                hint: "Username",
                controller: loginController.usernameController),
            SizedBox(
              height: 20,
            ),
            TxtField(
                hint: "Password",
                controller: loginController.passwordController),
            SizedBox(
              height: 40,
            ),
            WideButton(
                text: "Login",
                onPressed: loginController.login,
                color: Colors.green),
          ],
        ),
      )),
    );
  }
}
