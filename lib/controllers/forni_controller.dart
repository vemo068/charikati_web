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

  void initFields() {
    nameController.text = selectedForni!.name;
    phoneController.text = selectedForni!.phone;
  }

  getAllFornis() async {
    fornis = await httpService.getFornis();
    update();
  }

  saveForni() async {
    if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
      Forni forni =
          Forni(
            id: selectedForni != null ? selectedForni!.id : null,
            name: nameController.text, phone: phoneController.text);
      await httpService.insertForni(forni);
      await getAllFornis();
      Get.back();
      nameController.text = "";
      phoneController.text = "";
      update();
    }
  }
  // deleteForni(int id) async {
  //   await httpService.deleteForni(id);
  //   update();
  // }

  deleteForni() async {
    Get.back();
    Get.back();
    await httpService.deleteForni(selectedForni!.id!);
    await getAllFornis();
    nameController.text = "";
    phoneController.text = "";
    update();
  }
}
