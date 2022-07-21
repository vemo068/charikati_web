import 'package:charikati/models/designation.dart';

class Product {
  int? id;
  String name;

  int price;
  int designationId;
  Product({required this.name, required this.price,required this.designationId,this.id});


   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'designationId': designationId,
      
    };
  }
   factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ,
      price: map['price'],
      designationId: map['designationId'],
     
    );
  }
}
