import 'package:flutter/material.dart';
import 'package:school_app/shared/widgets/reusable_button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/courses_model.dart';

class CoursePaymentScreen extends StatelessWidget {
  final Courses course;

  const CoursePaymentScreen({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var couponCodeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.teal,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25, 15, 5, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.course_title} : ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      course.subject!,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.course_price} : ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${course.price} ${AppLocalizations.of(context)!.moneyType}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      AppLocalizations.of(context)!.course_coupon,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      alignment: AlignmentDirectional.center,
                      child: TextFormField(
                        cursorHeight: 0,
                        cursorWidth: 0,
                        keyboardType: TextInputType.number,
                        controller: couponCodeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey[200]!,
                              width: 3,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey[200]!,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      AppLocalizations.of(context)!.course_discount,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${course.discount} % ',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      AppLocalizations.of(context)!.course_price_discount,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '900 ${AppLocalizations.of(context)!.moneyType}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          ),
          reusableButton(
              text: AppLocalizations.of(context)!.payment,
              function: () {},
              radius: 0,
              width: double.infinity),
        ],
      ),
    );
  }
}
