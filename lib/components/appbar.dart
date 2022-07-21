import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';

AppBar charikatiAppBar(String title) {
  return AppBar(
    title: Text(title),
    foregroundColor: kcwhite,
    backgroundColor: kcmain,
    elevation: 0,
  );
}
