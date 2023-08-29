import 'package:bc_keeper/data/models/Template.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/cards_controller.dart';
import 'package:bc_keeper/presentation/pages/Card/controllers/template_controller.dart';
import 'package:bc_keeper/presentation/widgets/TemplateEditCard.dart';
import 'package:bc_keeper/presentation/widgets/TemplateEditingWidget.dart';
import 'package:flutter/material.dart';

class AligningWidget extends StatelessWidget {
  const AligningWidget({
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
          print("Çalıştı");

          templateController.selectedTemplate.update((val) {
            val?.hierarchy?.fullname = templateText;
          });
        },
      ),
    );
  }
}
