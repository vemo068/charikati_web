import 'package:charikati/models/designation.dart';
import 'package:charikati/services/database_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DesignationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  List<Designation> designations = [];
  Designation? selectedDesignation;
  final db = DatabaseService();

  @override
  void onInit() async {
    getAllDesignations();
    super.onInit();
  }

  saveDesignation() async {
    Designation des = Designation(name: nameController.text);
    db.insertDesignation(des);
    getAllDesignations();
    Get.back();
    nameController.clear();

    update();
  }

  Future<void> getAllDesignations() async {
    designations = await db.getDesignations();
    update();
  }

  
  Future<String> getDesigntaionName(int id) async {
    var des= await db.designation(id);
    return des.name;
  }
}
