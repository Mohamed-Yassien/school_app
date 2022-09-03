import 'package:flutter/material.dart';

class ReusableDivider extends StatelessWidget {
  const ReusableDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 20, horizontal: 15),
      child: Divider(
        color: Colors.grey[200],
      ),
    );
  }
}
