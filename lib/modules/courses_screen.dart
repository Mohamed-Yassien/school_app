import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/modules/bottom_filter_screen.dart';
import 'package:school_app/modules/course_detail_screen.dart';
import 'package:school_app/shared/methods.dart';
import 'package:school_app/shared/widgets/reusable_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            : Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Scaffold.of(context).showBottomSheet((context) {
                      return const BottomFilter();
                    });
                  },
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Icon(
                        Icons.filter_alt,
                        size: 15,
                      ),
                      Text(AppLocalizations.of(context)!.filterData),
                    ],
                  ),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     left: 15,
                    //     top: 25,
                    //     bottom: 10,
                    //   ),
                    //   child: Text(
                    //     'RECENT COURSES',
                    //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    //         // fontWeight: FontWeight.bold,
                    //         // fontSize: 18,
                    //         ),
                    //   ),
                    // ),
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
                                '${'${cubit.coursesWithoutFilter![index].numberOfLectures}'} ${AppLocalizations.of(context)!.lecture}',
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
                ),
              );
      },
    );
  }
}
