import 'dart:io';

import 'package:charikati/models/buy.dart';
import 'package:charikati/models/client.dart';
import 'package:charikati/models/order_buy.dart';
import 'package:charikati/styles/styles.dart';
import 'package:intl/intl.dart';

import 'package:charikati/models/order_sell.dart';

import 'package:charikati/models/sell.dart';

import 'package:charikati/services/pdf_services/pdf_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// final Uint8List fontData = File('assets/NotoNaskhArabic-bold.ttf').readAsBytesSync();
// final ttf = Font.ttf(fontData.buffer.asByteData());
class PdfInvoiceApi {
  static Future<File> generateSell(
      Sell sell, List<OrderSell> orderSells) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      theme: ThemeData.withFont(),
      build: (context) => [
        headerSell(sell),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            clientInfo(sell.client),
          ],
        ),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Divider(),
        ordersList(orderSells),
        Divider(),
        Text(formatCurrency.format(sell.total!)),
        Text("ARRETE LA PRESENTE FACTURE A LA SOMME DE . " +
            converter.convertInt(sell.total!).toUpperCase() +
            " D.A"),
      ],
      //footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument( name: 'FACTURE de ${sell.client.name} LE ${sell.date}', pdf: pdf);
  }

  static Widget clientInfo(Cliente client) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("DOIT , ${client.name}"),
        SizedBox(),
        Text("N° I.F , ${client.nif}"),
        Text("N° R.C , ${client.rcn}"),
      ],
    );
  }

  static Widget ordersList(List<OrderSell> orders) {
    final headers = ['Designation', 'Unité', 'Quantité', 'Prix U.', 'Total'];
    final data = orders.map((order) {
      return [
        "${order.product.name}",
        // designation.name,
        "U",
        "${order.quantity}",
        "${formatCurrency.format(order.product.price)}",
        //  "${product.price}"
        "${formatCurrency.format(order.total)}",
      ];
    }).toList();
    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }

  static Widget headerSell(Sell sell) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        "SARL MAADEN SAHRA",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
            wordSpacing: 2),
      ),
      SizedBox(height: 0.4 * PdfPageFormat.cm),
      Text(
        "GHAMRA CENTRE GUEMAR W.D'EL-OUED",
        style: TextStyle(fontSize: 16, color: PdfColors.black),
      ),
      SizedBox(height: 0.3 * PdfPageFormat.cm),
      Text(
        "IMPORTATION DES EQUIPEMENTS & MATERIELS AU DOMAINE DE L'INDUSTRIE DES METAUX",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: PdfColors.black,
        ),
      ),
      SizedBox(height: 1 * PdfPageFormat.cm),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "SARL AU CAPITAL 15.000.000 D.A .",
            ),
            Text(
              "N° R.C , 21 B 0544700-00/39",
            ),
            Text(
              "N° I.F , 00213954470024",
            ),
            Text("N° I.S , 002139060004559"),
            Text("N° A.I , 39060016530"),
            Text("N° TELEPHONE , 06 96 00 67 11"),
            Text("N° TELEPHONE , 05 42 28 98 05"),
            Text("E-MAIL , maaden.sahra@gmail.com"),
          ]),
          clientSection1(sell),
        ],
      ),
    ]);
  }

  static Widget clientSection1(Sell sell) {
    return Column(children: [
      Text("GUEMAR LE ${sell.date.substring(0, 10)}"),
      Text("FACTURE N° ${sell.id}G / ${sell.date.substring(0, 4)} "),
      Text("CODE CLIENT : 00${sell.client.id}"),
    ]);
  }

  static Widget forniSection1(Buy buy) {
    return Column(children: [
      Text("GUEMAR LE ${buy.date.substring(0, 10)}"),
      Text("FACTURE N° ${buy.id}G / ${buy.date.substring(0, 4)} "),
      Text("CODE CLIENT : 00${buy.forni.id}"),
    ]);
  }

  static Widget buyHeader(Buy buy) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        "SARL MAADEN SAHRA",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
            wordSpacing: 2),
      ),
      SizedBox(height: 0.4 * PdfPageFormat.cm),
      Text(
        "GHAMRA CENTRE GUEMAR W.D'EL-OUED",
        style: TextStyle(fontSize: 16, color: PdfColors.black),
      ),
      SizedBox(height: 0.3 * PdfPageFormat.cm),
      Text(
        "IMPORTATION DES EQUIPEMENTS & MATERIELS AU DOMAINE DE L'INDUSTRIE DES METAUX",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: PdfColors.black,
        ),
      ),
      SizedBox(height: 1 * PdfPageFormat.cm),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "SARL AU CAPITAL 15.000.000 D.A .",
            ),
            Text(
              "N° R.C , 21 B 0544700-00/39",
            ),
            Text(
              "N° I.F , 00213954470024",
            ),
            Text("N° I.S , 002139060004559"),
            Text("N° A.I , 39060016530"),
            Text("N° TELEPHONE , 06 96 00 67 11"),
            Text("N° TELEPHONE , 05 42 28 98 05"),
            Text("E-MAIL , maaden.sahra@gmail.com"),
          ]),
        ],
      ),
    ]);
  }

  static Future<File> generateBuy(Buy buy, List<OrderBuy> orderBuy) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      theme: ThemeData.withFont(),
      build: (context) => [
        buyHeader(buy),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
          ],
        ),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Divider(),
        Divider(),
        Text(formatCurrency.format(buy.total!)),
        Text("ARRETE LA PRESENTE FACTURE A LA SOMME DE . " +
            converter.convertInt(buy.total!).toUpperCase() +
            " D.A"),
      ],
      //footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(
        name: 'FACTURE de ${buy.forni.name} LE ${buy.date}', pdf: pdf);
  }
}

TextStyle pdfStyle = const TextStyle(color: PdfColors.blue);
