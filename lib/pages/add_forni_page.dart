import 'package:charikati/components/appbar.dart';
import 'package:flutter/material.dart';

class AddForniPage extends StatelessWidget {
  const AddForniPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: charikatiAppBar("Ajouter un fournisseur"),
    );
  }
}
