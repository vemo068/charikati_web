import 'dart:math';

import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';

class FabAjoute extends StatelessWidget {
  final Function() ontap;
  final String text;
  const FabAjoute({Key? key, required this.ontap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: ontap,
      label: Text(text),
      icon: Icon(Icons.add),
      backgroundColor: kcmain,
      foregroundColor: kcwhite,
    );
  }
}
