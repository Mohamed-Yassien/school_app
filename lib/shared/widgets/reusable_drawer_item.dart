import 'package:flutter/material.dart';

Widget reusableDrawerItem({
  required BuildContext context,
  required String title,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          width: 25,
        ),
        const Icon(
          Icons.task_outlined,
        ),
      ],
    ),
  );
}
