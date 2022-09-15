import 'package:flutter/material.dart';

class ReusableMaterialButtonForChoice extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  ReusableMaterialButtonForChoice({
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        // horizontal: 30,
        vertical: 20,
      ),
      // width: double.infinity,
      width: 200,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: MaterialButton(
          color: Colors.teal,
          onPressed: onPress,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
