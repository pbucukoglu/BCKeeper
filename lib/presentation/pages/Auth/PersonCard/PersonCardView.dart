import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bc_keeper/app/routes/app_pages.dart';
import 'package:bc_keeper/presentation/pages/Auth/PersonCard/PersonCardController.dart';
import 'package:bc_keeper/presentation/pages/BussinessFolder/controllers/BusinessFolderController.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/template_controller.dart';
import 'package:bc_keeper/presentation/widgets/TemplateCardWidget.dart';

class PersonCardView extends StatelessWidget {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var argumentData = Get.arguments;

    int id = argumentData['id'];
    String path = argumentData["path"];
    String url = argumentData["url"];

    final PersonCardController personCardController =
        Get.find<PersonCardController>();
    final TemplateController templateController =
        Get.find<TemplateController>();
    final BusinessFolderController businessFolderController =
        Get.find<BusinessFolderController>();
    final CardsController cardController = Get.find<CardsController>();

    final double cardWidth = 0.8;
    final double cardHeight = 0.6;

    Future<void> fetchTemplate(int templateId) async {
      await templateController.fetchTemplate(templateId);
    }

    Future<void> fetchData() async {
      await personCardController.getHolderCardById(id);
      await fetchTemplate(
          personCardController.currentCard.value?.templateid ?? 0);
    }

    fetchData();

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Scaffold(
          appBar: AppBar(
            title: Text('BusCard'.tr),
          ),
          body: Obx(
            () => personCardController.status.value.isSuccess
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://api.bckeeper.com/' + path + "/" + url,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Card(
                          elevation: 2.0,
                          child: TemplateCardWidget(
                            cardWidth:
                                MediaQuery.of(context).size.width * cardWidth +
                                    50,
                            cardHeight: MediaQuery.of(context).size.height *
                                cardHeight /
                                2.3,
                            templateWidth: templateController.W,
                            card: personCardController.currentCard.value!,
                            templateHierarchy: templateController
                                .selectedTemplate.value?.hierarchy,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  String phoneNumber = personCardController
                                          .currentCard.value?.t1 ??
                                      "";
                                  if (phoneNumber.isNotEmpty) {
                                    await launch('tel:$phoneNumber');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                child: Text(
                                  "Call:".tr +
                                      (personCardController
                                              .currentCard.value?.t1 ??
                                          "NoNum".tr),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  String mobilePhoneNumber =
                                      personCardController
                                              .currentCard.value?.m1 ??
                                          "";
                                  if (mobilePhoneNumber.isNotEmpty) {
                                    await launch('tel:$mobilePhoneNumber');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                child: Text(
                                  "Call:".tr +
                                      (personCardController
                                              .currentCard.value?.m1 ??
                                          "NoNum".tr),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  String recipientEmail = personCardController
                                          .currentCard.value?.email ??
                                      "";
                                  if (recipientEmail.isNotEmpty) {
                                    await launch('mailto:$recipientEmail');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                child: Text('Sendmail'.tr,
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  String recipientPhoneNumber =
                                      personCardController
                                              .currentCard.value?.m1 ??
                                          "";
                                  if (recipientPhoneNumber.isNotEmpty) {
                                    try {
                                      await launch('sms:$recipientPhoneNumber');
                                    } catch (e) {
                                      print("Error launching SMS: $e");
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                child: Text("SendSMS".tr,
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          bottomNavigationBar: Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: GetBuilder<PersonCardController>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () async {
                      print("çalıştııııı");

                      await cardController.markCardFav(id);
                      await businessFolderController.getMyHolderCards();
                    },
                    icon: Obx(() {
                      return Icon(
                        Icons.star,
                        color: businessFolderController.businessFolderList
                                .value![currentIndex].favorite
                            ? Colors.yellow
                            : Colors.white,
                      );
                    }),
                  ),
                  IconButton(
                    onPressed: () {
                      // Social button onPressed logic
                      Get.toNamed(Routes.SOCIALMEDIA);
                    },
                    icon: Icon(Icons.people, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      // Share button onPressed logic
                      Get.toNamed(Routes.SHARECARD);
                    },
                    icon: Icon(Icons.share, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      // Forward button onPressed logic
                      Get.toNamed(Routes.FORWARDCARD);
                    },
                    icon: Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Card(
                  elevation: 2.0,
                  child: TemplateCardWidget(
                    cardWidth: MediaQuery.of(context).size.width /
                        1.3, // Set width to screen height

                    cardHeight: MediaQuery.of(context).size.height,
                    // Set height to screen width
                    templateWidth: templateController.W,
                    card: personCardController.currentCard.value!,
                    templateHierarchy:
                        templateController.selectedTemplate.value?.hierarchy,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
