import 'package:charikati/controllers/login_controller.dart';
import 'package:charikati/models/user.dart';
import 'package:charikati/pages/home.dart';
import 'package:charikati/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WelcomeController extends GetxController {
  final LoginController loginController = Get.find<LoginController>();
  final dataLogin = GetStorage();
  @override
  void onInit() {
   // testConnection();
    super.onInit();
  }

  testConnection() {
    if (dataLogin.read('username') != null &&
        dataLogin.read('password') != null) {
      loginController.currentUser = User(
        password: dataLogin.read('password'),
        username: dataLogin.read('username'),
      );
      Get.to(()=>HomePage());
    } else {
      Get.to(()=>LoginPage());
    }
  }
}
