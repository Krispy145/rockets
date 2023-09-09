import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppPageTransition extends CustomTransitionPage {
  AppPageTransition.leftToRight({super.key, super.name, required Widget child, super.opaque = false, super.barrierDismissible = true, Curve curve = Curves.ease})
      : super(
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1.0, 0.0);
            const end = Offset.zero;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

  AppPageTransition.rightToLeft({super.key, super.name, required Widget child, super.opaque = false, super.barrierDismissible = true, Curve curve = Curves.ease})
      : super(
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

  AppPageTransition.topToBottom({super.key, super.name, required Widget child, super.opaque = false, super.barrierDismissible = true, Curve curve = Curves.ease})
      : super(
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, -1.0);
            const end = Offset.zero;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

  AppPageTransition.bottomToTop({super.key, super.name, required Widget child, super.opaque = false, super.barrierDismissible = true, Curve curve = Curves.ease})
      : super(
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
