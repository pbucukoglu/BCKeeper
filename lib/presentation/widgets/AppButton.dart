import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.fillColor,
    this.icon, // Add the icon parameter
  }) : super(key: key);

  final void Function()? onPressed;
  final String buttonText;
  final Color? fillColor;
  final IconData? icon; // Define the iaccon parameter

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _buttonAnimation;
  bool _isButtonEnabled = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _buttonAnimation =
        Tween<double>(begin: 1, end: 0).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isButtonEnabled = true;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _buttonAnimation.value,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            _isButtonEnabled = false;
            _animationController.forward().then((_) {
              if (widget.onPressed != null) widget.onPressed!();
              _animationController.reverse();
              _isButtonEnabled = true;
            });
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: widget.fillColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon !=
                  null) // Add the condition to check if an icon is provided
                Icon(
                  widget.icon,
                  size: 24,
                ),
              SizedBox(width: 8),
              Text(
                widget.buttonText,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
