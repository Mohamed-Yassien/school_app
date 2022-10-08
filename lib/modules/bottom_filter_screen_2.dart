import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/cubit/courses_cubit/courses_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:school_app/cubit/instructor_cubit/instructor_cubit.dart';

class BottomFilterScreen2 extends StatelessWidget {
  const BottomFilterScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        var cubit = CoursesCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 2,
            ),
            color: Colors.teal,
          ),
          height: 270,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10,
                    top: 20,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            cubit.closeFilter();
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.teal,
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
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.instructor,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                              ),
                              // if (cubit
                              //     .instructorCubit.instructorsModel!.instructors!.isNotEmpty)
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    iconSize: 25,
                                    iconEnabledColor: Colors.teal,
                                    iconDisabledColor: Colors.teal,
                                    value: cubit
                                        .instructorCubit.selectedInstructor,
                                    items: List.generate(
                                      context
                                          .watch<InstructorCubit>()
                                          .instructorsNames!
                                          .length,
                                      // cubit.instructorCubit.instructorsNames!
                                      //     .length,
                                      (index) => DropdownMenuItem<String>(
                                        value: context
                                            .watch<InstructorCubit>()
                                            .instructorsNames![index],
                                        child: Text(
                                          context
                                              .watch<InstructorCubit>()
                                              .instructorsNames![index],
                                          style: const TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                    onChanged: (val) {
                                      cubit.changeInstructorName(val!);
                                    },
                                    isExpanded: true,
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
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            cubit.closeDatesFilter();
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.teal,
                            size: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: Text(
                                      cubit.fromDateController ??
                                          AppLocalizations.of(context)!.from,
                                      style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate:
                                          cubit.fromDate ?? DateTime.now(),
                                      firstDate: DateTime(1990),
                                      lastDate: DateTime(2030),
                                    ).then(
                                      (dateValue) {
                                        if (dateValue != null) {
                                          cubit.fromDate = dateValue;
                                          print(cubit.fromDate.toString());
                                          cubit.changeFromDateContainerString(
                                            DateFormat.yMd().format(dateValue),
                                          );
                                          cubit.filterCoursesWithDates();
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
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        cubit.toDateController,
                                        style: const TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate:
                                            cubit.toDate ?? DateTime.now(),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2025),
                                      ).then(
                                        (dateValue) {
                                          if (dateValue != null) {
                                            cubit.toDate = dateValue;
                                            print(cubit.toDate.toString());
                                            cubit.changeToDateContainerString(
                                              DateFormat.yMd()
                                                  .format(dateValue),
                                            );
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
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: OutlinedButton(
                    clipBehavior: Clip.antiAlias,
                    onPressed: () {
                      Navigator.pop(context);
                      // cubit.filterCoursesWithDates();
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 25,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.ok,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
