import 'package:bc_keeper/data/models/BusinessCard.dart';
import 'package:bc_keeper/presentation/pages/Auth/PersonCard/PersonCardController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:share_plus/share_plus.dart';

class CardSharingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersonCardController personCardController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text('Kart Bilgilerini Paylaş'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Paylaşılacak Bilgileri Seçiniz",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey[400],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      personCardController.currentCard.value?.fullname ?? "",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildInfoRow(
                      "Ünvan",
                      personCardController.currentCard.value?.title1 ?? "",
                      personCardController.titleSwitch,
                    ),
                    _buildInfoRow(
                      "Telefon",
                      personCardController.currentCard.value?.t1 ?? "",
                      personCardController.phoneSwitch,
                    ),
                    _buildInfoRow(
                      "Cep Telefonu",
                      personCardController.currentCard.value?.m1 ?? "",
                      personCardController.mobileSwitch,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _shareSelectedInfo(personCardController);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Buton rengi
                        ),
                        child: Text(
                          "Kart Bilgilerini Paylaş",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    String title,
    String value,
    RxBool switchValue,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ${value}",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Obx(() => Switch(
              value: switchValue.value,
              onChanged: (newValue) {
                switchValue.value = newValue;
              },
              activeColor: Colors.green,
            )),
      ],
    );
  }

  void _shareSelectedInfo(PersonCardController controller) {
    BusinessCard? card = controller.currentCard.value;

    String shareText = "";

    if (controller.titleSwitch.value &&
        controller.currentCard.value?.title1?.isNotEmpty == true) {
      shareText += "Ünvan: ${controller.currentCard.value?.title1}\n";
    }

    if (controller.phoneSwitch.value &&
        controller.currentCard.value?.t1?.isNotEmpty == true) {
      shareText += "Telefon: ${controller.currentCard.value?.t1}\n";
    }

    if (controller.mobileSwitch.value &&
        controller.currentCard.value?.m1?.isNotEmpty == true) {
      shareText += "Cep Telefonu: ${controller.currentCard.value?.m1}\n";
    }

    Share.share(shareText);
  }
}
