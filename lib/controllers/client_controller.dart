import 'package:charikati/models/client.dart';
import 'package:charikati/services/database_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  final DatabaseService db = DatabaseService();
  List<Client> clients = [];
  Client? selectedClient;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
    Client client = Client(
        name: name, phone: phoneController.text, email: emailController.text);
    await db.insertClient(client);
    getAllClients();
    Get.back();
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    update();
  }

  void getAllClients() async {
    clients = await db.getClients();
    update();
  }
}
