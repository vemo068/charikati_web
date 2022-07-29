
import 'package:charikati/models/forni.dart';

class Buy {
  int? id;
  int? total;
  String date;
  Forni forni;
  Buy({required this.date, this.total, required this.forni, this.id});

  //toJson method to convert the object to json format
  Map<String, dynamic> toJson() {
    return {
      'buyId': id,
      'total': total,
      'date': date,
      'forni': forni.toJson(),
    };
  }

  //fromJson method to convert the json to object format
  factory Buy.fromJson(Map<String, dynamic> json) {
    return Buy(
      id: json['buyId']?.toInt() ?? 0,
      total: json['total']?.toInt() ?? 0,
      date: json['date'],
      forni: Forni.fromJson(json['forni']),
    );
  }
}
