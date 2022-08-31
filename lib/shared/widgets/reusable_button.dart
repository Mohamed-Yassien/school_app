import 'package:flutter/material.dart';

import '../constants.dart';

Widget reusableButton({
  required String text,
  required VoidCallback function,
  double width = double.infinity,
  double radius = 25,
}) {
  return Container(
    decoration: BoxDecoration(
        color: defaultColor,
      borderRadius: BorderRadius.circular(radius)
    ),
    width: width,
    child: MaterialButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    ),
  );
}
