import 'package:charikati/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({Key? key, required this.product}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text("${product.price}"),
      title: Text(product.name),
     
    );
  }
}
