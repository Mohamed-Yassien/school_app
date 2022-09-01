import 'package:flutter/material.dart';
import 'package:school_app/shared/constants.dart';

class ReusableTextField extends StatelessWidget {
  TextEditingController? controller;
  String? initialValue;
  final String textLabel;
  final Color? color;
  final bool isPassword;
  final Function validate;
  final VoidCallback? suffixPressed;
  final VoidCallback? onTap;
  IconButton? iconData;
  int? maxLines;
  final Function? onSubmit;
  final TextInputType type;
  final bool inRating;
  final Function onChange;

  ReusableTextField({
    required this.controller,
    this.isPassword = false,
    required this.textLabel,
    this.color,
    required this.validate,
    this.maxLines = 1,
    this.suffixPressed,
    this.onTap,
    this.iconData,
    required this.type,
    this.onSubmit,
    this.inRating = false,
    required this.onChange,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      keyboardType: type,
      style: TextStyle(
        fontSize: 16,
        color: color ?? defaultColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        label: Text(textLabel),
        labelStyle:  TextStyle(
          fontSize: 12,
          color: color ?? defaultColor,
        ),
        suffixIcon: inRating ? iconData : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: color ?? defaultColor,
            width: 3,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:  BorderSide(
            color: color ?? Colors.teal,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      obscureText: isPassword,
      onTap: onTap,
      maxLines: maxLines,
      onFieldSubmitted: (val) => onSubmit!(val),
      validator: (val) => validate(val),
      onChanged: (val) => onChange(val),
    );
  }
}
