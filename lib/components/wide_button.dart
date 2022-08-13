import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  WideButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      minWidth: double.infinity,
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text,
          style: mediButtonStyle,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
