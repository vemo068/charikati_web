import 'package:charikati/components/client_card.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsList extends StatelessWidget {
  ClientsList({Key? key}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: clientController,
        builder: (_) {
          return ListView.builder(
            itemCount: clientController.clients.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ClientCard(client: clientController.clients[index]),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          );
        });
  }
}
