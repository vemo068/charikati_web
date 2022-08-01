import 'package:charikati/components/appbar.dart';
import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
   BuyPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:charikatiAppBar("title")
      
    );
  }
}