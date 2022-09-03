import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableCard extends StatelessWidget {
  final String imageUrl;
  final String baseText;
  final String secondText;
  final String trailingText;
  final VoidCallback onCardTap;
  final BoxShape boxShape;
  final bool isStudent;

  const ReusableCard({
    super.key,
    required this.imageUrl,
    required this.baseText,
    required this.secondText,
    required this.trailingText,
    required this.onCardTap,
    this.boxShape = BoxShape.rectangle,
    this.isStudent = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 80,
                        width: 90,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: boxShape,
                          border: Border.all(
                            color: Colors.grey[100]!,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            baseText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            secondText,
                            style:
                                Theme.of(context).textTheme.caption?.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment:
                          isStudent ? Alignment.centerLeft : Alignment.center,
                      child: Text(
                        trailingText,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
