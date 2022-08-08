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
    getClientSells();
    super.onInit();
  }

  void saveSell() async {
    Sell sell = Sell(
      total: 0,
      client: clientController.selectedClient!,
      date: DateTime.now().toString().substring(0, 16),
    );
    await httpService.insertSell(sell);
    await getClientSells();
    update();
  }

  Future<void> getClientSells() async {
    var b =
        await httpService.getClientSells(clientController.selectedClient!.id!);
    if (b != null) {
      sells = b;
    } else {
      sells = [];
    }

    update();
  }

  void updateSell() async {
    selectedSell = await httpService.getSellById(selectedSell!.id!);
    await getClientSells();
    update();
  }

  void printSell() async {
    final File file = await PdfInvoiceApi.generateSell(selectedSell!);
    PdfApi.openFile(file);
  }

  deleteSell() async {
    await httpService.deleteSell(selectedSell!.id!);
    await getClientSells();
    update();
  }
}
