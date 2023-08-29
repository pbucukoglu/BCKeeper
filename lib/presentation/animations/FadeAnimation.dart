import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final double? delay;
  final int? duration;
  final Widget child;

  FadeAnimation({this.delay = 1, this.duration = 3000, required this.child});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Future.delayed(Duration(milliseconds: (duration! * delay!).round())),
      builder: (context, snapshot) {
        return AnimatedOpacity(
          opacity: snapshot.connectionState == ConnectionState.done ? 1 : 0,
          duration: Duration(milliseconds: duration!),
          child: child,
        );
      },
    );
  }
}
