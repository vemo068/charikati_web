import 'package:charikati/components/order_dialog.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrderButton extends StatelessWidget {
  const AddOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return OrderDialog();
            });
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kcmain)),
        child: Center(
            child: Text(
          "Add Order",
          style: mediButtonStyle.copyWith(color: kcmain),
        )),
      ),
    );
  }
}
