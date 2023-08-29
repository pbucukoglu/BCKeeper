import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef NameChangedCallback = void Function(String newName);

class NameWidget extends StatefulWidget {
  final String? initialName;

  final NameChangedCallback onChanged;

  NameWidget({this.initialName, required this.onChanged});

  @override
  _NameWidgetState createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _nameController.addListener(() {
      widget.onChanged(_nameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildEditingWidget();
  }

  Widget buildEditingWidget() {
    return Row(
      children: [
        SizedBox(width: 25),
        Expanded(
          child: TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: 'EnterInfo'.tr,
            ),
          ),
        ),
        SizedBox(width: 25),
      ],
    );
  }
}
