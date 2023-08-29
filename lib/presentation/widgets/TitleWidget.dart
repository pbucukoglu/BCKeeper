import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    if (title != "") {
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title ?? "title yok",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return Text(
        title ?? "title yok",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
    }
  }
}
