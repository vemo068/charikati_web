import 'dart:io';
import 'dart:typed_data';

import 'package:charikati/components/logo.dart';
import 'package:charikati/models/client.dart';
import 'package:charikati/models/designation.dart';
import 'package:charikati/models/order.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/services/database_services.dart';
import 'package:charikati/services/pdf_services/pdf_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;

// final Uint8List fontData = File('assets/NotoNaskhArabic-bold.ttf').readAsBytesSync();
// final ttf = Font.ttf(fontData.buffer.asByteData());
class PdfInvoiceApi {
  static Future<File> generate(Sell sell) async {
    final DatabaseService db = DatabaseService();

    List<Order> orders = await db.getBuyOrders(sell.id!);
    Client client = await db.client(sell.clientId);
    final pdf = Document();

    pdf.addPage(MultiPage(
      theme: ThemeData.withFont(),
      build: (context) => [
        header(),
        Divider(),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(sell.date), clientInfo(client)]),
        SizedBox(height: 3 * PdfPageFormat.cm),
        ordersList(orders),
        Divider(),
      ],
      //footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }

  static Widget clientInfo(Client client) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(client.name),
        Text(client.email),
        Text(client.phone),
      ],
    );
  }

  static Widget ordersList(List<Order> orders)  {
    final DatabaseService db = DatabaseService();
    final headers = [
      'Designation',
      'Unité',
          'Quantité',
      'Prix U.',
      'Total'
    ];
    final data =  orders.map((order)  {
      // Product product = await db.product(order.productId);
      // Designation designation = await db.designation(product.designationId);
      return [
        "${order.productId}",
        // designation.name,
        "U",
        "${order.contity}",
        "${order.total/order.contity}",
      //  "${product.price}"
       "${order.total}",
      ];
    }).toList();
    return  Table.fromTextArray(
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
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("R.C.  N°: 39/00-21B0544700"),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("NIF: 002139054470024", style: pdfStyle),
          Text("غمرة الوسطى – قمار – الوادي",
              style: pdfStyle, textDirection: TextDirection.rtl),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Tel : 05.42.28.98.05", style: pdfStyle),
          Text("استيراد التجهيزات والمعدات المرتبطة بصناعة المعادن",
              style: pdfStyle),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Email : maaden.sahra@gmail.com", style: pdfStyle),
          Text("رأسمال: 15,000,000.00 دج", style: pdfStyle),
        ]),
      ])
    ]);
  }
}

TextStyle pdfStyle = const TextStyle(color: PdfColors.blue);
