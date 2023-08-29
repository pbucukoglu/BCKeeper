// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bc_keeper/data/models/BusinessCard.dart';
import 'package:bc_keeper/data/models/Template.dart';
import 'package:bc_keeper/presentation/widgets/CardLogo.dart';
import 'package:bc_keeper/presentation/widgets/CardText.dart';

class TemplateCardWidget extends StatelessWidget {
  const TemplateCardWidget({
    Key? key,
    required this.cardWidth,
    required this.cardHeight,
    required this.templateWidth,
    required this.card,
    required this.templateHierarchy,
  }) : super(key: key);

  final double cardWidth;
  final double cardHeight;
  final int templateWidth;
  final BusinessCard? card;
  final TemplateHierarchy? templateHierarchy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Stack(
        children: [
          if (templateHierarchy != null && templateHierarchy?.fullname != null)
            CardText(
              ratio: templateWidth / cardWidth,
              templateText: templateHierarchy?.fullname,
              text: card?.fullname ?? "",
              cardWidth: cardWidth,
              cardHeight: cardHeight,
            ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.title1,
            text: card?.title1 ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.title2,
            text: card?.title2 ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.department!,
            text: card?.department ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.companyName!,
            text: card?.companyName ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.address1!,
            text: card?.address1 ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.address2!,
            text: card?.address2 ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.address3!,
            text: card?.address3 ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.district!,
            text: card?.district ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.zipcode,
            text: card?.zipcode ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.city,
            text: card?.city ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.country,
            text: card?.country ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.email,
            text: card?.email ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.t1,
            text: card?.t1 ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.t2,
            text: card?.t2 ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.m1,
            text: card?.m1 ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.m2,
            text: card?.m2 ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          CardText(
            ratio: templateWidth / cardWidth,
            templateText: templateHierarchy?.f,
            text: card?.f ?? "",
            cardWidth: cardWidth,
            cardHeight: cardHeight,
          ),
          if (templateHierarchy?.logo1?.Visible ?? false)
            CardLogo(
              ratio: templateWidth / cardWidth,
              logo: templateHierarchy?.logo1,
              url: card?.logourl1 ?? "",
              cardWidth: cardWidth,
              cardHeight: cardHeight,
            ),
          if (templateHierarchy?.logo2?.Visible ?? false)
            CardLogo(
              ratio: templateWidth / cardWidth,
              logo: templateHierarchy?.logo2,
              url: card?.logourl2 ?? "",
              cardWidth: cardWidth,
              cardHeight: cardHeight,
            ),
          if (templateHierarchy?.logo3?.Visible ?? false)
            CardLogo(
              ratio: templateWidth / cardWidth,
              logo: templateHierarchy?.logo3,
              url: card?.logourl3 ?? "",
              cardWidth: cardWidth,
              cardHeight: cardHeight,
            ),
        ],
      ),
    );
  }
}
