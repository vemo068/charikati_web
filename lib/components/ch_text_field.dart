import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const TxtField({Key? key, required this.hint, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: getInputType(hint),
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

TextInputType getInputType(String type) {
  if (type.contains("phone")) {
    return TextInputType.phone;
  } else if (type.contains("email")) {
    return TextInputType.emailAddress;
  } else if (type.contains("password")) {
    return TextInputType.text;
  } else {
    return TextInputType.text;
  }
}
