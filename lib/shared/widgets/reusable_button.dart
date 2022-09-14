import 'package:flutter/material.dart';

Widget reusableButton({
  required String text,
  required VoidCallback function,
  double width = double.infinity,
  double radius = 25,
  Color buttonColor = Colors.teal,
}) {
  return Container(
    decoration: BoxDecoration(
        color:buttonColor,
      borderRadius: BorderRadius.circular(radius)
    ),
    width: width,
    child: MaterialButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style:  TextStyle(
          color: buttonColor == Colors.teal? Colors.white : Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    ),
  );
}
