import 'package:get/get.dart';

class HomeController extends GetxController {



  int tabIndex = 0;


  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}