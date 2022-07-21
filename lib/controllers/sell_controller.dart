import 'dart:ffi';
import 'dart:io';

import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/services/database_services.dart';
import 'package:charikati/services/pdf_services/pdf_api.dart';
import 'package:charikati/services/pdf_services/pdf_invoice_api.dart';
import 'package:get/get.dart';

class SellController extends GetxController {
  final DatabaseService db = DatabaseService();
  final ClientController clientController = Get.find<ClientController>();
  List<Sell> sells = [];
  Sell? selectedSell;
  @override
  void onInit() {
    getClientBuys();
    super.onInit();
  }

  void saveSell() async {
    Sell sell = Sell(
      clientId: clientController.selectedClient!.id!,
      date: DateTime.now().toString().substring(0, 16),
    );
    await db.insertSell(sell);
    getClientBuys();
    update();
  }

  void getClientBuys() async {
    var b = await db.getClientBuys(clientController.selectedClient!.id!);
    if (b != null) {
      sells = b;
    } else {
      sells = [];
    }

    update();
  }

  void printSell() async {
    final File file = await PdfInvoiceApi.generate(selectedSell!);
    PdfApi.openFile(file);
  }
}
