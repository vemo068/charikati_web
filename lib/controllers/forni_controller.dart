import 'package:charikati/models/forni.dart';
import 'package:charikati/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForniController extends GetxController {
  final HttpService httpService = HttpService();
  List<Forni> fornis = [];
  Forni? selectedForni;

  @override
  void onInit() {
    getAllFornis();
    super.onInit();
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  getAllFornis() async {
    fornis = await httpService.getFornis();
    update();
  }

  saveForni() async {
    if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
      Forni forni =
          Forni(name: nameController.text, phone: phoneController.text);
      await httpService.insertForni(forni);
      nameController.text = "";
      phoneController.text = "";
      update();
    }
  }
  // deleteForni(int id) async {
  //   await httpService.deleteForni(id);
  //   update();
  // }

}
