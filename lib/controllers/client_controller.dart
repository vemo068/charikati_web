import 'package:charikati/models/client.dart';
import 'package:charikati/pages/home.dart';
import 'package:charikati/services/http_service.dart';
import 'package:charikati/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  final HttpService httpService = HttpService();
  List<Cliente> clients = [];
  Cliente? selectedClient;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController naiController = TextEditingController();
  TextEditingController nisController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController nifController = TextEditingController();
  TextEditingController rcnController = TextEditingController();

  @override
  void onInit() {
    getAllClients();
    super.onInit();
  }

  void saveClient(bool isEdit) async {
    if (nameController.text.isEmpty ||
        nifController.text.isEmpty ||
        rcnController.text.isEmpty) {
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
      String name = nameController.text;
      if (name.endsWith(" ")) {
        name = name.substring(0, name.length - 1);
      }
      Cliente client = Cliente(
        id: selectedClient != null ? selectedClient!.id : null,
        name: name,
        phone: phoneController.text,
        nif: nifController.text,
        rcn: rcnController.text,
        address: addressController.text,
        nai: naiController.text,
        nis: nisController.text,
        description: descriptionController.text,
      );
      Get.defaultDialog(
        title: isEdit ? "Saving changes" : "Adding Client..",
        middleText: "",
        content: CircularProgressIndicator(),
        barrierDismissible: false,
      );
      await httpService.insertClient(client);

      Get.back();
      if (selectedClient != null) {
        updateClient();
      }
      getAllClients();
      Get.back();
      nameController.clear();
      phoneController.clear();
      nifController.clear();
      rcnController.clear();
      naiController.clear();
      nisController.clear();
      descriptionController.clear();
      addressController.clear();
    }

    update();
  }

  bool loadingClients = false;
  void getAllClients() async {
    loadingClients = true;
    update();
    clients = await httpService.getClients();
    loadingClients = false;
    update();
  }

  deleteClient() async {
    Get.defaultDialog(
      title: "Deleting Client..",
      middleText: "",
      content: CircularProgressIndicator(),
      barrierDismissible: false,
    );
    await httpService.deleteClient(selectedClient!.id!);
    Get.offAll(() => HomePage());
    nameController.clear();
    phoneController.clear();
    nifController.clear();
    rcnController.clear();
    naiController.clear();
    nisController.clear();
    descriptionController.clear();
    addressController.clear();
    getAllClients();
    update();
  }

  void initFields() {
    nameController.text = selectedClient!.name;
    phoneController.text =
        selectedClient!.phone != null ? selectedClient!.phone! : "";
    naiController.text =
        selectedClient!.nai == null ? "" : selectedClient!.nai!;
    nisController.text =
        selectedClient!.nis == null ? "" : selectedClient!.nis!;
    descriptionController.text =
        selectedClient!.description == null ? "" : selectedClient!.description!;
    addressController.text =
        selectedClient!.address == null ? "" : selectedClient!.address!;
    nifController.text = selectedClient!.nif;
    rcnController.text = selectedClient!.rcn;
  }

  updateClient() async {
    selectedClient = await httpService.getClientById(selectedClient!.id!);
    update();
  }
}
