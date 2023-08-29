import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:bc_keeper/data/models/Template.dart';

class TemplateEditCard extends StatelessWidget {
  const TemplateEditCard({
    Key? key,
    required this.value,
    required this.text,
    required this.card,
    required this.onTemplateTextChange,
  }) : super(key: key);

  final String? value;
  final TemplateText? text;
  final TemplateCard? card;
  final void Function(TemplateText text) onTemplateTextChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value.toString()),
        Row(
          // Yatayda düzenlemek için Row widget'ı ekliyoruz
          children: [
            Expanded(
              // X koordinatı input kutusu
              child: TextFormField(
                initialValue: text?.X.toString(),
                onChanged: (input) {
                  text?.X = int.tryParse(input.toString()) ?? 0;
                  onTemplateTextChange(text!);
                },
                decoration: InputDecoration(
                  hintText: "EnterX".tr,
                  labelText: "X:",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              // Y koordinatı input kutusu
              child: TextFormField(
                initialValue: text?.Y.toString(),
                onChanged: (input) {
                  text?.Y = int.tryParse(input.toString()) ?? 0;
                  onTemplateTextChange(text!);
                },
                decoration: InputDecoration(
                  hintText: "EnterY".tr,
                  labelText: "Y:",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        TextFormField(
          initialValue: text?.Fsize.toString(),
          onChanged: (input) {
            text?.Fsize = int.tryParse(input.toString()) ?? 0;
            onTemplateTextChange(text!);
          },
          decoration: InputDecoration(
              hintText: "EnterFontSize".tr,
              labelText: "FontSize:".tr,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
              labelText: "Bold:",
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          value: text?.Bold,
          hint: Text("IsBold".tr),
          items: [
            DropdownMenuItem(
              value: true,
              child: Text("Yes".tr),
            ),
            DropdownMenuItem(
              value: false,
              child: Text("No".tr),
            )
          ],
          onChanged: (value) {
            text?.Bold = value;
            onTemplateTextChange(text!);
          },
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
              labelText: "Visible:".tr,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          value: text?.Visible,
          hint: Text("IsVisible".tr),
          items: [
            DropdownMenuItem(
              value: true,
              child: Text("Yes".tr),
            ),
            DropdownMenuItem(
              value: false,
              child: Text("No".tr),
            )
          ],
          onChanged: (value) {
            text?.Visible = value;
            onTemplateTextChange(text!);
          },
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
              labelText: "Italic:",
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          value: text?.Italic,
          hint: Text("IsItalic".tr),
          items: [
            DropdownMenuItem(
              value: true,
              child: Text("Yes".tr),
            ),
            DropdownMenuItem(
              value: false,
              child: Text("No".tr),
            )
          ],
          onChanged: (value) {
            text?.Italic = value;
            onTemplateTextChange(text!);
          },
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
              labelText: "Align:".tr,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          value: text?.align,
          hint: Text("IsAlign".tr),
          items: [
            DropdownMenuItem(
              value: "left",
              child: Text("Start".tr),
            ),
            DropdownMenuItem(
              value: "center",
              child: Text("Mid".tr),
            ),
          ],
          onChanged: (value) {
            text?.align = value;
            onTemplateTextChange(text!);
          },
        ),
      ],
    );
  }
}
