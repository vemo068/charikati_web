class Product {
  int? id;
  String name;
  int stock;
  int price;

  Product({required this.name, required this.price, this.id,required this.stock});

  //toJson method to convert the object to json format
  Map<String, dynamic> toJson() {
    return {
      'productId': id,
      'name': name,
      'stock': stock,
      'price': price,
    };
  }
  //fromJson method to convert the json to object format
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['productId'],
      name: json['name'],
      stock: json['stock']?.toInt() ?? 0,
      price: json['price']?.toInt() ?? 0,
    );
  }
 
}
