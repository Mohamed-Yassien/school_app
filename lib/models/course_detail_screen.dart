import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/school_cubit/cubit.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/models/courses_model.dart';
import 'package:school_app/shared/widgets/reusable_calender_date.dart';

class CourseDetailScreen extends StatelessWidget {
  final Courses course;

  CourseDetailScreen({
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolCubit, SchoolStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
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
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: Divider(
                      color: Colors.grey[200],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      bottom: 25,
                    ),
                    child: Text(
                      'COURSE DATES ',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          // fontWeight: FontWeight.bold,
                          // fontSize: 18,
                          ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: ReusableCalenderDate(
                      dates: List<DateTime?>.generate(
                        course.dates!.length,
                        (index2) => DateTime.parse(
                          course.dates![index2],
                        ),
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

// ReusableCalenderDate(
// dates: List<DateTime?>.generate(
// course.dates!.length,
// (index2) => DateTime.parse(
// course.dates![index2],
// ),
// ),
// ),
