import 'package:charikati/models/client.dart';

class Sell {
  int? id;
  int? total;
  String date;
  Client client;
  Sell({required this.date, this.total, required this.client, this.id});
  

  //toJson method to convert the object to json format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total': total,
      'date': date,
      'client': client.toJson(),
    };
  }
  //fromJson method to convert the json to object format
  factory Sell.fromJson(Map<String, dynamic> json) {
    return Sell(
      id: json['id']?.toInt() ?? 0,
      total: json['total']?.toInt() ?? 0,
      date: json['date'],
      client: Client.fromJson(json['client']),
    );
  }
}
