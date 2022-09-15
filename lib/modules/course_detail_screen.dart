import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/cubit/school_cubit/cubit.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/models/courses_model.dart';
import 'package:school_app/modules/course_payment_screen.dart';
import 'package:school_app/shared/methods.dart';
import 'package:school_app/shared/widgets/reusable_divider.dart';
import 'package:school_app/shared/widgets/sfcalender.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../shared/widgets/reusable_button.dart';

class CourseDetailScreen extends StatelessWidget {
  final Courses course;

  const CourseDetailScreen({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolCubit, SchoolStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
          body: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 10, 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      SizedBox(
                        height: 170,
                        width: double.infinity,
                        child: Container(
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/subject.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                            // border: Border.all(
                            //   color: Colors.grey[100]!,
                            //   width: 1,
                            // ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        height: 50,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          color: Colors.black54,
                        ),
                        child: Text(
                          '${course.subject}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  const ReusableDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.instructor,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        course.instructor!,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.course_desc} : ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        course.description!,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.num_of_lec} : ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${course.numberOfLectures} ${AppLocalizations.of(context)!.lecture}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.first_date_section} : ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (course.firstSectionDate != null)
                        Text(
                          '${DateFormat.yMd().format(
                            DateTime.parse(course.firstSectionDate!),
                          )}     ${DateFormat.jm().format(
                            DateTime.parse(course.firstSectionDate!),
                          )}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                    ],
                  ),
                  const ReusableDivider(),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 15),
                    child: Text(
                      AppLocalizations.of(context)!.courseDates,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            // fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      height: 300,
                      padding: const EdgeInsets.all(15),
                      child: SFCalenderDates(
                        dates: List<DateTime>.generate(
                          course.dates!.length,
                          (index2) => DateTime.parse(
                            course.dates![index2],
                          ),
                        ),
                        dateTime: course.dates!,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 5,
                    ),
                    child: reusableButton(
                      text: AppLocalizations.of(context)!.subscribe,
                      function: () {
                        navigateTo(
                          widget: CoursePaymentScreen(
                            course: course,
                          ),
                          context: context,
                        );
                      },
                      radius: 5,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
