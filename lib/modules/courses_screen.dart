import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/modules/course_detail_screen.dart';
import 'package:school_app/shared/methods.dart';
import 'package:school_app/shared/widgets/reusable_card.dart';

import '../cubit/school_cubit/cubit.dart';
import '../cubit/school_cubit/states.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolCubit, SchoolStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SchoolCubit.get(context);

        return cubit.coursesModel == null || cubit.coursesWithoutFilter == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.grey[100],
                          child: IconButton(
                            onPressed: () {
                              cubit.closeFilter();
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.grey[100],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'instructor :   ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                ),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      iconSize: 30,
                                      iconEnabledColor: Colors.grey,
                                      iconDisabledColor: Colors.grey,
                                      value: cubit.selectedInstructor,
                                      items: List.generate(
                                        cubit.instructorsNames!.length,
                                        (index) => DropdownMenuItem<String>(
                                          value: cubit.instructorsNames![index],
                                          child: Text(
                                            cubit.instructorsNames![index],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                      onChanged: (val) {
                                        cubit.changeInstructorName(val!);
                                      },
                                      isExpanded: false,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 18,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.grey[100],
                            child: IconButton(
                              onPressed: () {
                                cubit.closeDatesFilter();
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.black,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: Colors.grey[100]!,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        cubit.fromDateController,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime.now(),
                                      ).then(
                                        (dateValue) {
                                          if (dateValue != null) {
                                            cubit.fromDate = dateValue;
                                            print(cubit.fromDate.toString());
                                            cubit.changeFromDateContainerString(
                                                DateFormat.yMd()
                                                    .format(dateValue));
                                            if (cubit.fromDate != null) {
                                              cubit.filterCoursesWithDates();
                                            }
                                            // cubit.fromDateController =
                                            //     DateFormat.yMd()
                                            //         .format(dateValue);
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: InkWell(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                            color: Colors.grey[100]!,
                                            width: 2,
                                          ),
                                        ),
                                        child: Text(
                                          cubit.toDateController,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1990),
                                          lastDate: DateTime(2025),
                                        ).then(
                                          (dateValue) {
                                            if (dateValue != null) {
                                              cubit.toDate = dateValue;
                                              print(cubit.toDate.toString());
                                              cubit.changeToDateContainerString(
                                                  DateFormat.yMd()
                                                      .format(dateValue));
                                              cubit.filterCoursesWithDates();
                                              // cubit.toDateController =
                                              //     DateFormat.yMd()
                                              //         .format(dateValue);
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Divider(
                      color: Colors.grey[200],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 25,
                      bottom: 10,
                    ),
                    child: Text(
                      'RECENT COURSES',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          // fontWeight: FontWeight.bold,
                          // fontSize: 18,
                          ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ReusableCard(
                          imageUrl: 'assets/images/subject.jpg',
                          baseText:
                              '${cubit.coursesWithoutFilter![index].subject}',
                          secondText:
                              '${cubit.coursesWithoutFilter![index].instructor}',
                          trailingText:
                              '${'${cubit.coursesWithoutFilter![index].numberOfLectures}'} lec',
                          onCardTap: () {
                            navigateTo(
                              widget: CourseDetailScreen(
                                  course: cubit.coursesWithoutFilter![index]),
                              context: context,
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: cubit.coursesWithoutFilter!.length,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
