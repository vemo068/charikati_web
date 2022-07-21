class Order {
  int? id;
  int contity;
  int total;
  int productId;
  int sellId;
  Order(
      {this.id,
      required this.total,
      required this.contity,
      required this.productId,
      required this.sellId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total': total,
      'contity': contity,
      'productId': productId,
      'sellId': sellId,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id']?.toInt() ?? 0,
      contity: map['contity'],
      productId: map['productId'],
      sellId: map['sellId'],
      total: map['total'],
    );
  }
}
