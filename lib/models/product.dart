class Product {
  int? id;
  String name;
  int stock;
  int sellPrice;
  int buyPrice;

  Product({required this.name, required this.sellPrice, this.id,required this.stock,required this.buyPrice});

  //toJson method to convert the object to json format
  Map<String, dynamic> toJson() {
    return {
      'productId': id,
      'name': name,
      'stock': stock,
      'sellPrice': sellPrice,
      'buyPrice': buyPrice,
    };
  }
  //fromJson method to convert the json to object format
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['productId'],
      name: json['name'],
      stock: json['stock']?.toInt() ?? 0,
      sellPrice: json['sellPrice']?.toInt() ?? 0,
      buyPrice: json['buyPrice']?.toInt() ?? 0,
    );
  }
 
}
