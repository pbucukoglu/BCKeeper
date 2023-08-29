import 'package:flutter/material.dart';

class PageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (route.settings.name == '/login') {
      // Giriş sayfasından geçiş
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(0.0, 0.5, curve: Curves.ease),
            ),
          ),
          child: child,
        ),
      );
    } else if (route.settings.name == '/home') {
      // Ana sayfaya geçiş
      return ScaleTransition(
        scale: Tween<double>(begin: 1.2, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0.5, 1.0, curve: Curves.ease),
          ),
        ),
        child: child,
      );
    } else {
      return child;
    }
  }
}
