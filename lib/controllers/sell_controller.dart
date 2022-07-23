import 'dart:io';

import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/services/http_service.dart';
import 'package:charikati/services/pdf_services/pdf_api.dart';
import 'package:charikati/services/pdf_services/pdf_invoice_api.dart';
import 'package:get/get.dart';

class SellController extends GetxController {
  final HttpService httpService = HttpService();
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
      total: 0,
      client: clientController.selectedClient!,
      date: DateTime.now().toString().substring(0, 16),
    );
    await httpService.insertSell(sell);
   await getClientBuys();
    update();
  }

  Future<void> getClientBuys() async {
    var b =
        await httpService.getClientSells(clientController.selectedClient!.id!);
    if (b != null) {
      sells = b;
    } else {
      sells = [];
    }

    update();
  }
 void updateSell()async{
  await httpService.insertSell(selectedSell!);
   await getClientBuys();
    update();
 }
  void printSell() async {
    final File file = await PdfInvoiceApi.generate(selectedSell!);
    PdfApi.openFile(file);
  }
}
