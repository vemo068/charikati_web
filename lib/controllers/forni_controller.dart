import 'package:charikati/models/forni.dart';
import 'package:charikati/services/http_service.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      Forni forni = Forni(
          id: selectedForni != null ? selectedForni!.id : null,
          name: nameController.text,
          phone: phoneController.text);
      await httpService.insertForni(forni);
      if (selectedForni != null) {
        updateForni();
      }
      await getAllFornis();
      Get.back();
      nameController.text = "";
      phoneController.text = "";

      update();
    } else {
      Get.snackbar("Erreur", "Veuillez remplir tous les champs",
          snackPosition: SnackPosition.TOP,
          backgroundColor: kcbackground,
          borderRadius: 10,
          snackStyle: SnackStyle.FLOATING,
          margin: EdgeInsets.all(10),
          borderColor: Colors.red,
          borderWidth: 2,
          colorText: kcsecondary,
          //   textStyle: TextStyle(color: Colors.white),
          duration: Duration(seconds: 2));
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

  updateForni() async {
    selectedForni = await httpService.getForniById(selectedForni!.id!);
    update();
  }
}
