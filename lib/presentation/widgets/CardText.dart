import 'package:flutter/material.dart';
import 'package:bc_keeper/data/models/Template.dart';

class CardText extends StatelessWidget {
  CardText({
    Key? key,
    required this.templateText,
    required this.text,
    required this.cardWidth,
    required this.cardHeight,
    required this.ratio,
  }) : super(key: key);

  TemplateText? templateText;
  final String text;
  final double cardWidth;
  final double cardHeight;
  final double ratio;
  Widget build(BuildContext context) {
    final templateText = this.templateText;
    final text = this.text;
    final cardWidth = this.cardWidth;
    final cardHeight = this.cardHeight;
    final ratio = this.ratio;

    final textAlignment = templateText?.align;
    final textSize =
        double.tryParse((templateText?.Fsize ?? "14").toString()) ?? 1 / ratio;
    final textLength = text.length;
    final textWidth = textSize * textLength;

    double? xAlignment = 0;
    print(textAlignment);
    if (textAlignment == "center") {
      xAlignment = (cardWidth - textWidth / 2) / 2;
    } else if (textAlignment == "left") {
      xAlignment =
          (double.tryParse(templateText?.X.toString() ?? "1") ?? 1) / ratio;
    }
    final yAlignment =
        double.tryParse(templateText?.Y.toString() ?? "1")! / ratio - textSize;

    return Positioned(
      left: xAlignment,
      top: yAlignment,
      child: Text(
        templateText?.Visible == true ? text : "",
        style: TextStyle(
          color: Colors.black,
          fontWeight:
              templateText?.Bold == true ? FontWeight.bold : FontWeight.normal,
          fontSize: textSize,
          fontStyle: templateText?.Italic == true
              ? FontStyle.italic
              : FontStyle.normal,
        ),
      ),
    );
  }
}
