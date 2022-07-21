import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';

class FabAjoute extends StatelessWidget {
  final Function() ontap;
  const FabAjoute({Key? key, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: ontap,
      label: Text("Ajouter"),
      icon: Icon(Icons.add),
      backgroundColor: kcmain,
      foregroundColor: kcwhite,
    );
  }
}
