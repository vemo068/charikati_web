import 'package:avatars/avatars.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientInfoBox extends StatelessWidget {
  ClientInfoBox({Key? key}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> sendEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{}),
    );

    await launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kcmain,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: clientController.selectedClient!.id!,
              child: Avatar(
                name: clientController.selectedClient!.name,
                placeholderColors: [kcaccent],
              ),
            ),
            SizedBox(height: 10),
            Text(clientController.selectedClient!.name,
                style: mediHeading1Style.copyWith(color: kcwhite)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    _makePhoneCall(clientController.selectedClient!.phone);
                  },
                  color: Colors.white,
                  height: 40,
                  minWidth: 40,
                  child: Icon(Icons.call_outlined),
                ),
                SizedBox(width: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    sendEmail(clientController.selectedClient!.email);
                  },
                  color: Colors.white,
                  height: 40,
                  minWidth: 40,
                  child: Icon(Icons.mail),
                ),
              ],
            )
          ],
        ));
  }
}
