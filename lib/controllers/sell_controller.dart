import 'dart:io';

import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/controllers/order_controller.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/services/http_service.dart';
import 'package:charikati/services/pdf_services/pdf_api.dart';
import 'package:charikati/services/pdf_services/pdf_invoice_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellController extends GetxController {
  final HttpService httpService = HttpService();
  final ClientController clientController = Get.find<ClientController>();
  List<Sell> sells = [];
  Sell? selectedSell;
  bool loadingSells = false;
  bool saveLoading = false;
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

    Get.defaultDialog(
        title: "Adding Sell..",
        middleText: "",
        content: CircularProgressIndicator(),barrierDismissible: false,);
    await httpService.insertSell(sell);
    Get.back();
    await getClientSells();
    update();
  }

  Future<void> getClientSells() async {
    loadingSells = true;
    update();
    var b =
        await httpService.getClientSells(clientController.selectedClient!.id!);
    if (b != null) {
      sells = List.from(b.reversed);
    } else {
      sells = [];
    }
    loadingSells = false;
    update();
  }

  void updateSell() async {
    selectedSell = await httpService.getSellById(selectedSell!.id!);
    await getClientSells();
    update();
  }

  void printSell() async {
    OrderSellController orderSellController = Get.find<OrderSellController>();
    final File file = await PdfInvoiceApi.generateSell(
        selectedSell!, orderSellController.orders);
    PdfApi.openFile(file);
  }

  deleteSell() async {
    await httpService.deleteSell(selectedSell!.id!);
    await getClientSells();
    update();
  }
}
