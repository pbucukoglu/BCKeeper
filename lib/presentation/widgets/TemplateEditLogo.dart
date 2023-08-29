import 'package:flutter/material.dart';

import 'package:bc_keeper/data/models/Template.dart';

class TemplateEditLogo extends StatelessWidget {
  const TemplateEditLogo({
    Key? key,
    required this.logo,
    required this.onLogoChange,
  }) : super(key: key);

  final Logo? logo;
  final void Function(Logo logo) onLogoChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: logo?.X.toString(),
                onChanged: (input) {
                  logo?.X = int.tryParse(input.toString()) ?? 0;
                  onLogoChange(logo!);
                },
                decoration: InputDecoration(
                  hintText: "EnterX",
                  labelText: "X:",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                initialValue: logo?.Y.toString(),
                onChanged: (input) {
                  logo?.Y = int.tryParse(input.toString()) ?? 0;
                  onLogoChange(logo!);
                },
                decoration: InputDecoration(
                  hintText: "EnterY",
                  labelText: "Y:",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        TextFormField(
          initialValue: logo?.W.toString(),
          onChanged: (input) {
            logo?.W = int.tryParse(input.toString()) ?? 0;
            onLogoChange(logo!);
          },
          decoration: InputDecoration(
            hintText: "EnterWidth",
            labelText: "Width:",
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        TextFormField(
          initialValue: logo?.H.toString(),
          onChanged: (input) {
            logo?.H = int.tryParse(input.toString()) ?? 0;
            onLogoChange(logo!);
          },
          decoration: InputDecoration(
            hintText: "EnterHeight",
            labelText: "Height:",
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: "Alignment:",
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          value: logo?.align,
          hint: Text("SelectAlignment"),
          items: [
            DropdownMenuItem(
              value: "left",
              child: Text("Left"),
            ),
            DropdownMenuItem(
              value: "center",
              child: Text("Center"),
            ),
            DropdownMenuItem(
              value: "right",
              child: Text("Right"),
            ),
          ],
          onChanged: (value) {
            logo?.align = value.toString();
            onLogoChange(logo!);
          },
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: "Visible:",
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          value: logo?.Visible,
          hint: Text("IsVisible"),
          items: [
            DropdownMenuItem(
              value: true,
              child: Text("Yes"),
            ),
            DropdownMenuItem(
              value: false,
              child: Text("No"),
            ),
          ],
          onChanged: (value) {
            logo?.Visible = value;
            onLogoChange(logo!);
          },
        ),
      ],
    );
  }
}
