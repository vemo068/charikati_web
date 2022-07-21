
class Product {
  int? id;
  String name;

  int price;
  
  Product({required this.name, required this.price,this.id});


   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      
      
    };
  }
   factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ,
      price: map['price'],
     
     
    );
  }
}
