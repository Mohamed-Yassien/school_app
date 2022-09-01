import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/shared/widgets/reusable_calender_date.dart';

import '../cubit/school_cubit/cubit.dart';
import '../cubit/school_cubit/states.dart';
import '../shared/constants.dart';
import '../shared/widgets/reusable_text_field.dart';

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
                    padding: const EdgeInsets.only(left: 8.0),
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
                              size: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            padding: const EdgeInsets.all(10),
                            color: Colors.grey[100],
                            child: Row(
                              children: [
                                Text(
                                  'instructor :   ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Colors.grey[400],
                                      ),
                                ),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      iconSize: 30,
                                      iconEnabledColor: Colors.black,
                                      iconDisabledColor: Colors.black,
                                      value: cubit.selectedInstructor,
                                      items: List.generate(
                                        cubit.instructorsNames!.length,
                                        (index) => DropdownMenuItem<String>(
                                          value: cubit.instructorsNames![index],
                                          child: Text(
                                            cubit.instructorsNames![index],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
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
                  Row(
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
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ReusableTextField(
                                  textLabel: 'From',
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      // return 'age must not be empty';
                                    }
                                  },
                                  type: TextInputType.number,
                                  onChange: (String value) {},
                                  controller: cubit.fromDateController,
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
                                          cubit.fromDateController.text =
                                              DateFormat.yMd()
                                                  .format(dateValue);
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ReusableTextField(
                                    textLabel: 'To',
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        // return 'classRoom must not be empty';
                                      }
                                    },
                                    type: TextInputType.number,
                                    onChange: (String value) {},
                                    controller: cubit.toDateController,
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
                                            cubit.toDateController.text =
                                                DateFormat.yMd()
                                                    .format(dateValue);
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.grey[100],
                                  child: IconButton(
                                    onPressed: () {
                                      cubit.filterCoursesWithDates();
                                    },
                                    icon: const Icon(
                                      Icons.search,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Card(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.grey[300],
                                            backgroundImage: const AssetImage(
                                              'assets/images/subject.jpg',
                                            ),
                                            radius: 35,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // cubit
                                                //     .coursesModel!
                                                //     .courses![index]
                                                //     .subject!,
                                                '${cubit.coursesWithoutFilter![index].subject}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2
                                                    ?.copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${cubit.coursesWithoutFilter![index].instructor}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '${'${cubit.coursesWithoutFilter![index].numberOfLectures}'} lec',
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2
                                                ?.copyWith(
                                                  color: defaultColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //     vertical: 14,
                                  //     horizontal: 8,
                                  //   ),
                                  //   child: Divider(
                                  //     color: Colors.grey[200],
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(12.0),
                                  //   child: ReusableCalenderDate(
                                  //     dates: List<DateTime?>.generate(
                                  //       cubit.coursesWithoutFilter![index]
                                  //           .dates!.length,
                                  //       (index2) => DateTime.parse(
                                  //         cubit.coursesWithoutFilter![index]
                                  //             .dates![index2],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
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
