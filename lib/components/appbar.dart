import 'package:charikati/styles/colors.dart';
import 'package:flutter/material.dart';

AppBar charikatiAppBar(String title,{List<Widget>? actions}) {
  return AppBar(
    actions: actions,
    title: Text(title),
    foregroundColor: kcwhite,
    backgroundColor: kcmain,
    elevation: 0,
  );
}
