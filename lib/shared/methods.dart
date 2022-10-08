import 'package:flutter/material.dart';
import 'package:school_app/shared/routes/route_with_animation.dart';

void navigateToAndFinish({
  required Widget widget,
  required context,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    RouteWithAnimation(
      screen: widget,
    ),
    (route) => false,
  );
}

void navigateTo({
  required Widget widget,
  required context,
}) {
  Navigator.push(
    context,
    RouteWithAnimation(
      screen: widget,
    ),
  );
}
