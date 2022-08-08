import 'package:charikati/controllers/forni_controller.dart';
import 'package:charikati/models/buy.dart';
import 'package:charikati/services/http_service.dart';
import 'package:get/get.dart';

class BuyController extends GetxController {
  final HttpService httpService = HttpService();
  final ForniController forniController = Get.find<ForniController>();

  List<Buy> buys = [];
  Buy? selectedBuy;


  @override
  void onInit() async{
    await getForniBuys();
    super.onInit();
  }
  void saveBuy() async {
    Buy buy = Buy(
      total: 0,
      forni: forniController.selectedForni!,
      date: DateTime.now().toString().substring(0, 16),
    );
    await httpService.insertBuy(buy);
    await getForniBuys();
    update();
  }

  getForniBuys() async{

    var b = await httpService.getForniBuys(forniController.selectedForni!.id!);
    if (b != null) {
      buys = b;
    } else {
      buys = [];
    }

    update();
  }

  void updateBuy() async {
    selectedBuy = await httpService.getBuyById(selectedBuy!.id!);
     await getForniBuys();
    update();
  }
  deleteBuy() async {
    await httpService.deleteBuy(selectedBuy!.id!);
    await getForniBuys();
    update();
  }

}
