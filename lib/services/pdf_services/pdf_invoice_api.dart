import 'dart:io';

import 'package:charikati/models/buy.dart';
import 'package:charikati/models/client.dart';

import 'package:charikati/models/order_sell.dart';

import 'package:charikati/models/sell.dart';

import 'package:charikati/services/pdf_services/pdf_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

// final Uint8List fontData = File('assets/NotoNaskhArabic-bold.ttf').readAsBytesSync();
// final ttf = Font.ttf(fontData.buffer.asByteData());
class PdfInvoiceApi {
  static Future<File> generateSell(Sell sell) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      theme: ThemeData.withFont(),
      build: (context) => [
        header(),
        Divider(),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(sell.date), clientInfo(sell.client)]),
        SizedBox(height: 3 * PdfPageFormat.cm),
        // ordersList(orders),
        Divider(),
      ],
      //footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }

  static Widget clientInfo(Cliente client) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(client.name),
        Text(client.phone),
      ],
    );
  }

  static Widget ordersList(List<OrderSell> orders) {
    final headers = ['Designation', 'Unité', 'Quantité', 'Prix U.', 'Total'];
    final data = orders.map((order) {
      // Product product = await db.product(order.productId);
      // Designation designation = await db.designation(product.designationId);
      return [
        "${order.product.name}",
        // designation.name,
        "U",
        "${order.quantity}",
        "${order.product.price}",
        //  "${product.price}"
        "${order.total}",
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

  static Widget header() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        "SARL MAADEN SAHRA",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
            wordSpacing: 2),
      ),
      SizedBox(height: 0.5 * PdfPageFormat.cm),
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
          Text(
            "Fax: +212 (0) 5 22 22 22 22",
            style: TextStyle(fontSize: 16, color: PdfColors.black),
          ),
        ],
      ),
    ]);
  }

  static generateBuy(Buy buy) {}
}

TextStyle pdfStyle = const TextStyle(color: PdfColors.blue);
