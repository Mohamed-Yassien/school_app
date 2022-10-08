import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/courses_cubit/courses_cubit.dart';
import 'package:school_app/cubit/courses_cubit/courses_states.dart';
import 'package:school_app/modules/bottom_filter_screen_2.dart';
import 'package:school_app/modules/course_detail_screen.dart';
import 'package:school_app/shared/methods.dart';
import 'package:school_app/shared/widgets/reusable_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../shared/constants.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit, CoursesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CoursesCubit.get(context);

        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (cubit.coursesModel!.courses!.isEmpty) {
                return;
              } else {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const BottomFilterScreen2(),
                );
              }
            },
            label: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.filter_alt,
                  size: 15,
                ),
                Text(AppLocalizations.of(context)!.filterData),
              ],
            ),
          ),
          body: cubit.coursesModel == null || cubit.coursesWithoutFilter == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : cubit.coursesModel!.courses!.isEmpty
                  ? Center(
                      child: Text(
                        'no courses !!',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                        course:
                                            cubit.coursesWithoutFilter![index]),
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
