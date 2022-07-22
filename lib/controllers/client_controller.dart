import 'package:charikati/models/client.dart';
import 'package:charikati/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  final HttpService httpService = HttpService();
  List<Cliente> clients = [];
  Cliente? selectedClient;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nifController = TextEditingController();
  TextEditingController rcnController = TextEditingController();

  @override
  void onInit() {
    getAllClients();
    super.onInit();
  }

  void saveClient() async {
    String name = nameController.text;
    if (name.endsWith(" ")) {
      name = name.substring(0, name.length - 1);
    }
    Cliente client = Cliente(
        name: name, phone: phoneController.text,  nif: nifController.text, rcn: rcnController.text);
    await httpService.insertClient(client);
    getAllClients();
    Get.back();
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    update();
  }

  void getAllClients() async {
     clients = await httpService.getClients();
    update();
  }
}
