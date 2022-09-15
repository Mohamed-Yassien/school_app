import 'package:flutter/material.dart';

class ReusableRowForPlanDetails extends StatelessWidget {
  final String baseText;
  final String subText;

  const ReusableRowForPlanDetails({
    Key? key,
    required this.baseText,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          baseText,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.white,
              ),
        ),
        Text(
          subText,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
