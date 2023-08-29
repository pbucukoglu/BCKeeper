import 'dart:io';

import 'package:bc_keeper/data/models/Template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardLogo extends StatelessWidget {
  const CardLogo({
    Key? key,
    required this.logo,
    required this.url,
    required this.cardWidth,
    required this.cardHeight,
    required this.ratio,
  }) : super(key: key);

  final Logo? logo;
  final String url;
  final double cardWidth;
  final double cardHeight;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    final imageAlignment = logo?.align;
    if (logo?.W == 0) {
      logo?.W = logo?.H;
    }
    if (logo?.H == 0) {
      logo?.H = logo?.W;
    }

    double? xAlignment = 0;
    bool Visible = (logo?.Visible)!;
    if (imageAlignment == "center") {
      xAlignment = (cardWidth - (logo?.W ?? 1) / 2) / 2;
    } else if (imageAlignment == "left") {
      xAlignment = (double.tryParse(logo?.X.toString() ?? "1") ?? 1) / ratio;
    } else if (imageAlignment == "right") {
      xAlignment = (double.tryParse(logo?.X.toString() ?? "1") ?? 1) / ratio;
    }

    return Positioned(
      left: (imageAlignment == "left") ? xAlignment : 0,
      right: (imageAlignment == "right") ? xAlignment : 0,
      top: double.tryParse(logo?.Y.toString() ?? "1")! / ratio,
      child: url.startsWith('/data')
          ? Image.file(
              File(url),
              height: logo!.H! / ratio / ratio,
              width: logo!.W! / ratio / ratio,
            )
          : Image.network(
              'https://api.bckeeper.com/Logolar/${url}',
              height: logo!.H! / ratio / ratio,
              width: logo!.W! / ratio / ratio,
            ),
    );
  }
}
