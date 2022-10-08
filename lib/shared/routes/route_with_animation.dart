import 'package:flutter/material.dart';

class RouteWithAnimation extends PageRouteBuilder {
  final Widget screen;

  RouteWithAnimation({
    required this.screen,
  }) : super(
          pageBuilder: (context, animation, animation2) => screen,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, animation2, child) {
            // var begin = const Offset(0, -1);
            // var end = const Offset(0, 0);
            var begin = 0.0;
            var end = 1.0;
            final tween = Tween(begin: begin, end: end);
            final curvesAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );
            //
            // return SlideTransition(
            //   position: tween.animate(curvesAnimation),
            //   child: child,
            // );
            return ScaleTransition(
              scale: tween.animate(curvesAnimation),
              child: child,
            );
            // return RotationTransition(
            //   turns: tween.animate(curvesAnimation),
            //   child: child,
            // );
          },
        );
}
