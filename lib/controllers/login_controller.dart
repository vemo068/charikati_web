import 'package:charikati/models/user.dart';
import 'package:charikati/pages/home.dart';
import 'package:charikati/services/http_service.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  User? currentUser;
  final HttpService httpService = HttpService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Erreur",
        "Veuillez remplir tous les champs obligatoires",
        icon: Icon(
          Icons.error,
          color: Colors.red,
        ),
        backgroundColor: kcbackground,
        colorText: kcsecondary,
        borderColor: Colors.red,
        borderWidth: 1,
        borderRadius: 10,
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      );
    } else {
      currentUser = await httpService.loginUser(
          usernameController.text, passwordController.text);

      if (currentUser == null) {
        Get.snackbar(
          "Login failed",
          "Username or password is incorrect",
          icon: Icon(
            Icons.login,
            color: Colors.red,
          ),
          backgroundColor: kcbackground,
          colorText: kcsecondary,
          borderColor: Colors.red,
          borderWidth: 1,
          borderRadius: 10,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
        );
      } else {
        Get.to(() => HomePage());
      }
    }
  }
}
