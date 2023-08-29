import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      required this.controller,
      required this.hintText,
      this.icon,
      this.fillColor = Colors.white,
      this.isPassword = false});

  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final Color fillColor;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon == null ? null : Icon(icon),
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        controller: controller,
        obscureText: isPassword,
      ),
    );
  }
}
