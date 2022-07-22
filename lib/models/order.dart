import 'package:charikati/models/product.dart';
import 'package:charikati/models/sell.dart';

class OrderSell {
  int? id;
  int contity;
  int total;
  Product product;
  Sell sell;
  OrderSell(
      {this.id,
      required this.total,
      required this.contity,
      required this.product,
      required this.sell});
  //toJson method to convert the object to json format
  Map<String, dynamic> toJson() {
    return {
      'orderSellId': id,
      'total': total,
      'contity': contity,
      'product': product.toJson(),
      'sell': sell.toJson(),
    };
  }

  //fromJson method to convert the json to object format
  factory OrderSell.fromJson(Map<String, dynamic> json) {
    return OrderSell(
      id: json['orderSellId']?.toInt() ?? 0,
      total: json['total']?.toInt() ?? 0,
      contity: json['contity']?.toInt() ?? 0,
      product: Product.fromJson(json['product']),
      sell: Sell.fromJson(json['sell']),
    );
  }
}
