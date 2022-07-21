import 'package:flutter/material.dart';

class NormalPadding extends StatelessWidget {
  final Widget child;
  const NormalPadding({ Key? key,required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: child,
    );
  }
}