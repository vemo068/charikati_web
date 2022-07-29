
import 'package:charikati/models/buy.dart';
import 'package:charikati/models/product.dart';

class OrderBuy {
  int? id;
  int quantity;
  int total;
  Product product;
  Buy buy;
  OrderBuy(
      {this.id,
      required this.total,
      required this.quantity,
      required this.product,
      required this.buy});
  //toJson method to convert the object to json format
  Map<String, dynamic> toJson() {
    return {
      'orderBuyId': id,
      'total': total,
      'quantity': quantity,
      'product': product.toJson(),
      'buy': buy.toJson(),
    };
  }

  //fromJson method to convert the json to object format
  factory OrderBuy.fromJson(Map<String, dynamic> json) {
    return OrderBuy(
      id: json['orderBuyId']?.toInt() ?? 0,
      total: json['total']?.toInt() ?? 0,
      quantity: json['quantity']?.toInt() ?? 0,
      product: Product.fromJson(json['product']),
      buy: Buy.fromJson(json['buy']),
    );
  }
}
