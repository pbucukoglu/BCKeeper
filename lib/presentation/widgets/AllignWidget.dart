import 'package:flutter/material.dart';

class AlignWidget extends StatefulWidget {
  final double initialX;
  final double initialY;
  final void Function(double x, double y) onPositionChanged;

  AlignWidget({
    required this.initialX,
    required this.initialY,
    required this.onPositionChanged,
  });

  @override
  _AlignWidgetState createState() => _AlignWidgetState();
}

class _AlignWidgetState extends State<AlignWidget> {
  late TextEditingController _xController;
  late TextEditingController _yController;

  @override
  void initState() {
    super.initState();
    _xController = TextEditingController(text: widget.initialX.toString());
    _yController = TextEditingController(text: widget.initialY.toString());
    _xController.addListener(_onXChanged);
    _yController.addListener(_onYChanged);
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    super.dispose();
  }

  void _onXChanged() {
    double x = double.tryParse(_xController.text) ?? widget.initialX;
    widget.onPositionChanged(x, widget.initialY);
  }

  void _onYChanged() {
    double y = double.tryParse(_yController.text) ?? widget.initialY;
    widget.onPositionChanged(widget.initialX, y);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 25),
        Expanded(
          child: TextField(
            controller: _xController,
            decoration: InputDecoration(
              labelText: 'X',
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _yController,
            decoration: InputDecoration(
              labelText: 'Y',
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
