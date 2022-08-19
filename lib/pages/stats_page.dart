import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/controllers/stats_controller.dart';
import 'package:charikati/main.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsPage extends StatelessWidget {
  StatsPage({Key? key}) : super(key: key);
  final StatsController statsController = Get.put(StatsController());
  @override
  Widget build(BuildContext context) {
    statsController.inisTotals();
    return Scaffold(
      appBar: charikatiAppBar("Stats"),
      body: Column(
        children: [
          Expanded(flex: 1, child: TotalsContainer()),
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: NormalPadding(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: YearSlot(year: listOfYears[index]),
                            );
                          }),
                          itemCount: listOfYears.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class YearSlot extends StatelessWidget {
  final String year;
  const YearSlot({
    Key? key,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: kcsecondary),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            year,
            style: mediButtonStyle.copyWith(color: kcsecondary),
          ),
        ),
      ),
    );
  }
}

class TotalsContainer extends StatelessWidget {
  TotalsContainer({
    Key? key,
  }) : super(key: key);

  final StatsController statsController = Get.find<StatsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: NormalPadding(
        child: GetBuilder(
            init: statsController,
            builder: (_) {
              bool isBenifit =
                  statsController.totalSells > statsController.totalBuys;
              return Column(
                children: [
                  Text(
                    formatCurrency.format(statsController.totalSells -
                            statsController.totalBuys) +
                        " DA",
                    style: mediHeadlineStyle.copyWith(
                        color: isBenifit ? Colors.green : kcaccent),
                  ),
                  Text(
                    "Total",
                    style: mediSubheadingStyle.copyWith(color: kcwhite),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              formatCurrency.format(statsController.totalBuys) +
                                  " DA",
                              style: mediHeadlineStyle.copyWith(color: kcwhite),
                            ),
                            Text(
                              "Total des achats",
                              style:
                                  mediSubheadingStyle.copyWith(color: kcwhite),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              formatCurrency
                                      .format(statsController.totalSells) +
                                  " DA",
                              style: mediHeadlineStyle.copyWith(color: kcwhite),
                            ),
                            Text(
                              "Total des ventes",
                              style:
                                  mediSubheadingStyle.copyWith(color: kcwhite),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
      color: kcmain,
    );
  }
}
