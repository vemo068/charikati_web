import 'package:charikati/controllers/forni_controller.dart';
import 'package:charikati/models/buy.dart';
import 'package:charikati/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyController extends GetxController {
  final HttpService httpService = HttpService();
  final ForniController forniController = Get.find<ForniController>();
  bool loadingBuys = false;

  List<Buy> buys = [];
  Buy? selectedBuy;

  @override
  void onInit() async {
    await getForniBuys();
    super.onInit();
  }

  void saveBuy() async {
    Buy buy = Buy(
      total: 0,
      forni: forniController.selectedForni!,
      date: DateTime.now().toString().substring(0, 16),
    );
    Get.defaultDialog(
      title: "Adding Buy..",
      middleText: "",
      content: CircularProgressIndicator(),
      barrierDismissible: false,
    );
    await httpService.insertBuy(buy);
    await getForniBuys();
    Get.back();

    update();
  }

  getForniBuys() async {
    loadingBuys = true;
    update();
    var b = await httpService.getForniBuys(forniController.selectedForni!.id!);
    if (b != null) {
      buys = List.from(b.reversed);
    } else {
      buys = [];
    }
    loadingBuys = false;

    update();
  }

  void updateBuy() async {
    selectedBuy = await httpService.getBuyById(selectedBuy!.id!);
    await getForniBuys();
    update();
  }

  deleteBuy() async {
    Get.defaultDialog(
      title: "Deleting Buy..",
      middleText: "",
      content: CircularProgressIndicator(),
      barrierDismissible: false,
    );
    await httpService.deleteBuy(selectedBuy!.id!);
    Get.back();
    Get.back();
    await getForniBuys();
    update();
  }

  @override
  void onClose() {
    selectedBuy = null;
    super.onClose();
  }
}
