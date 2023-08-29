// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:bc_keeper/presentation/widgets/TemplateEditCard.dart';
import 'package:bc_keeper/presentation/widgets/TemplateEditLogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bc_keeper/data/models/Template.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/template_controller.dart';
import 'package:bc_keeper/presentation/widgets/TitleWidget.dart';

class TemplateEditingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardsController cardsController = Get.find();
    final TemplateController templateController = Get.find();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleWidget(title: "Logos".tr),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 20, top: 20),
              child: Text("Logo-1"),
            ),
            Obx(() => Padding(
                  padding: EdgeInsets.only(left: 5, right: 20, bottom: 15),
                  child: TemplateEditLogo(
                    logo: templateController
                        .selectedTemplate.value?.hierarchy?.logo1,
                    onLogoChange: (Logo logo) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.logo1 = logo;
                      });
                    },
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 20, top: 20),
              child: Text("Logo-2"),
            ),
            Obx(() => Padding(
                  padding: EdgeInsets.only(left: 5, right: 20, bottom: 15),
                  child: TemplateEditLogo(
                    logo: templateController
                        .selectedTemplate.value?.hierarchy?.logo2,
                    onLogoChange: (Logo logo) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.logo2 = logo;
                      });
                    },
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 20, top: 20),
              child: Text("Logo-3"),
            ),
            Obx(() => Padding(
                  padding: EdgeInsets.only(left: 5, right: 20, bottom: 15),
                  child: TemplateEditLogo(
                    logo: templateController
                        .selectedTemplate.value?.hierarchy?.logo3,
                    onLogoChange: (Logo logo) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.logo3 = logo;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "FullName".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 20),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.fullname,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.fullname,
                    onTemplateTextChange: (TemplateText templateText) {
                      //

                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.fullname = templateText;
                      });
                    },
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            TitleWidget(title: "FaxNo".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 15),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.f,
                    text:
                        templateController.selectedTemplate.value?.hierarchy?.f,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.f = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "Titles".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 20),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.title1,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.title1,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.title1 = templateText;
                      });
                    },
                  ),
                )),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 15),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.title2,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.title2,
                    onTemplateTextChange: (TemplateText templateText) {
                      //

                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.title2 = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "Department".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 20),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.department,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.department,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.department = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "CompanyName".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 20),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.companyName,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.companyName,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.companyName = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "District".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 20),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.district,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.district,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.district = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "ZipCode".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 20),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.zipcode,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.zipcode,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.zipcode = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "City".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 20),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.city,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.city,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.city = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "Country".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 20),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.country,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.country,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.country = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "E-mail".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 20),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.email,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.email,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.email = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "Addresses".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 15),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.address1,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.address1,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.address1 = templateText;
                      });
                    },
                  ),
                )),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 15),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.address2,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.address2,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.address2 = templateText;
                      });
                    },
                  ),
                )),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 15),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.address3,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.address3,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.address3 = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "Telephone Numbers".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 15),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.t1,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.t1,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.t1 = templateText;
                      });
                    },
                  ),
                )),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 15),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.t2,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.t2,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.t2 = templateText;
                      });
                    },
                  ),
                )),
            TitleWidget(title: "Mobile Phones".tr),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 15),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.m1,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.m1,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.m1 = templateText;
                      });
                    },
                  ),
                )),
            Obx(() => Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 15),
                  child: TemplateEditCard(
                    card: templateController
                        .selectedTemplate.value?.hierarchy?.card,
                    value: cardsController.currentCard.value?.m2,
                    text: templateController
                        .selectedTemplate.value?.hierarchy?.m2,
                    onTemplateTextChange: (TemplateText templateText) {
                      templateController.selectedTemplate.update((val) {
                        val?.hierarchy?.m2 = templateText;
                      });
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class AligningWidget extends StatelessWidget {
  AligningWidget({
    super.key,
    required this.templateController,
    required this.cardsController,
  });

  final TemplateController templateController;
  final CardsController cardsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 20, top: 20, bottom: 15),
      child: TemplateEditCard(
        card: templateController.selectedTemplate.value?.hierarchy?.card,
        value: cardsController.currentCard.value?.fullname,
        text: templateController.selectedTemplate.value?.hierarchy?.fullname,
        onTemplateTextChange: (TemplateText templateText) {
          templateController.selectedTemplate.update((val) {
            val?.hierarchy?.fullname = templateText;
          });
        },
      ),
    );
  }
}
