import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:bc_keeper/data/models/Template.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/template_controller.dart';
import 'package:bc_keeper/presentation/widgets/CardEditingWidget.dart';
import 'package:bc_keeper/presentation/widgets/TemplateCardWidget.dart';
import 'package:bc_keeper/presentation/widgets/TemplateEditingWidget.dart';

class CardEditView extends StatelessWidget {
  const CardEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TemplateController templateController =
        Get.find<TemplateController>();

    final CardsController cardsController = Get.find<CardsController>();

    cardsController.currentCard.listen((p0) {});

    cardsController.currentCard.value =
        cardsController.cardList?[cardsController.currentIndex.value];

    templateController.fetchTemplates(
        selectedId: cardsController.currentCard.value?.templateid);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'BusCard'.tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              await cardsController.updateCard();

              await templateController.updateTemplate();

              await templateController.fetchTemplate(
                  templateController.selectedTemplate.value?.id ?? 0);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Scrollbar(
          thumbVisibility: true,
          child: GetBuilder<TemplateController>(
            init: templateController,
            builder: (templateController) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 16),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Template'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                            child: Obx(() => templateController
                                            .templates.value !=
                                        null &&
                                    (templateController
                                            .templates.value?.isNotEmpty ??
                                        false)
                                ? DropdownButton<int>(
                                    value: cardsController
                                        .currentCard.value?.templateid,
                                    items: templateController.templates.value
                                        ?.map((Template template) {
                                      return DropdownMenuItem(
                                        value: template.id,
                                        child: Text(template.ad ?? ''),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        templateController.fetchTemplate(value);

                                        cardsController.currentCard
                                            .update((val) {
                                          val?.templateid = value;
                                        });
                                      }
                                    },
                                  )
                                : SizedBox()),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black45,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Obx(() =>
                          templateController.selectedTemplate.value == null
                              ? CircularProgressIndicator()
                              : AspectRatio(
                                  //850/500 pixel

                                  aspectRatio: 8.5 / 5,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      final cardWidth = constraints.maxWidth;
                                      final cardHeight = constraints.maxHeight;

                                      return TemplateCardWidget(
                                        cardWidth: cardWidth,
                                        cardHeight: cardHeight,
                                        templateWidth: templateController.W,
                                        card: cardsController.currentCard.value,
                                        templateHierarchy: templateController
                                            .selectedTemplate.value?.hierarchy,
                                      );
                                    },
                                  ),
                                )),
                    ),
                  ),

                  // CardEditPageView(),
                  CardEditPageView()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CardEditPageView extends StatefulWidget {
  const CardEditPageView({super.key});

  @override
  State<CardEditPageView> createState() => _CardEditPageViewState();
}

class _CardEditPageViewState extends State<CardEditPageView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        children: [
          // Text("ss"),
          // Text("ss")
          CardEditingWidget(),
          TemplateEditingWidget(),
        ],
      ),
    );
  }
}
