// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:school_app/shared/constants.dart';

class ReusableTextField extends StatelessWidget {
 final TextEditingController? controller;
 final String? initialValue;
  final String textLabel;
  final Color? color;
  final bool isPassword;
  final Function validate;
  final VoidCallback? suffixPressed;
  final VoidCallback? onTap;
  final IconButton? iconData;
 final int? maxLines;
  final Function? onSubmit;
  final TextInputType type;
  final bool inRating;
  final Function onChange;
  final Color fillColor;

  const ReusableTextField({
    Key? key,
    required this.controller,
    this.initialValue,
    required this.textLabel,
    this.color,
    this.isPassword = false,
    required this.validate,
    this.suffixPressed,
    this.onTap,
    this.iconData,
    this.maxLines = 1,
    this.onSubmit,
    required this.type,
    this.inRating = false,
    required this.onChange,
    this.fillColor = Colors.white,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      keyboardType: type,
      cursorColor: color ?? defaultColor,
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
        fillColor: fillColor,
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
