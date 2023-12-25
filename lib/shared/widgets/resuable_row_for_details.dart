import 'package:flutter/material.dart';

Widget reusableRowForTaskDetails({
  required String baseName,
  required Widget child,
  double height = 60,
  bool fillColor = true,
  Alignment alignment = Alignment.center,
}) {
  return Container(
    alignment: alignment,
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.teal,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(2),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.teal,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              baseName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            alignment: Alignment.centerLeft,
            height: height,
            padding: const EdgeInsets.all(15),
            child: child,
          ),
        ),
      ],
    ),
  );
}
