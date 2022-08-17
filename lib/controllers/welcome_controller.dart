import 'package:charikati/pages/login_page.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  @override
  void onInit() {
    testConnection();
    super.onInit();
  }

  testConnection() {
    //!Get.to(() => LoginPage());
  }
}
