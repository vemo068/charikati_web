import 'package:charikati/models/buy.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/services/http_service.dart';
import 'package:get/get.dart';

class StatsController extends GetxController {
  final HttpService httpService = HttpService();

  int totalBuys = 0;
  int totalSells = 0;
  List<Sell> allSells = [];
  List<Buy> allBuys = [];

  @override
  void onInit() {
    super.onInit();
  }

  void getAllSells() async {
    var b = await httpService.getAllSells();
    if (b != null) {
      allSells = b;
    } else {
      allSells = [];
    }
    update();
  }

  void getAllBuys() {
    httpService.getAllBuys().then((value) {
      if (value != null) {
        allBuys = value;
      } else {
        allBuys = [];
      }
      update();
    });
  }

  bool totalLoding = false;
  void getTotals() async {
    totalLoding = true;
    update();
    totalBuys = await httpService.getBuysTotal();
    totalSells = await httpService.getSellsTotal();
    totalLoding = false;
    update();
  }

  inisTotals() {
     getTotals();
    getAllSells();
    getAllBuys();
   
  }
}
