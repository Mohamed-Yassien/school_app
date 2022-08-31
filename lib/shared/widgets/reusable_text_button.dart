import 'package:flutter/material.dart';

Widget reusableTextButton({
  required String text,
  required VoidCallback function,
}) {
  return TextButton(
    onPressed: function,
    child: Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 15,
        color: Colors.black87
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.end,
    ),
  );
}
