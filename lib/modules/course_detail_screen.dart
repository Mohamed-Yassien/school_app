import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/school_cubit/cubit.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/models/courses_model.dart';
import 'package:school_app/shared/widgets/reusable_divider.dart';
import 'package:school_app/shared/widgets/sfcalender.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

        var cubit = SchoolCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.teal,
                size: 35,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12,
              top: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 150,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/subject.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Colors.grey[100]!,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              course.instructor!,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              course.description!,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const ReusableDivider(),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 20, 0, 15),
                    child: Text(
                      AppLocalizations.of(context)!.courseDates,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            // fontWeight: FontWeight.bold,
                            fontSize: 20,
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
                      vertical: 20,
                    ),
                    child: Center(
                      child: OutlinedButton(
                        onPressed: () {

                        },
                        child: const Text('Enroll'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
