import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/student_cubit/student_cubit.dart';
import 'package:school_app/cubit/student_cubit/student_states.dart';
import 'package:school_app/modules/bottom_filter_screen.dart';
import 'package:school_app/modules/course_detail_screen.dart';
import 'package:school_app/shared/methods.dart';
import 'package:school_app/shared/widgets/language_change_drop.dart';
import 'package:school_app/shared/widgets/reusable_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../cubit/school_cubit/cubit.dart';
import '../../cubit/school_cubit/states.dart';
import '../../shared/constants.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // return BlocConsumer<StudentCubit, StudentStates>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
    //     var cubit = StudentCubit.get(context);
    //
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: Text(
    //           'ALL  COURSES',
    //           style: Theme.of(context).textTheme.bodyText1!.copyWith(
    //                 color: defaultColor,
    //               ),
    //         ),
    //         actions: [
    //           LanguageChangeDrop(),
    //         ],
    //       ),
    //       floatingActionButton: FloatingActionButton.extended(
    //         onPressed: () {
    //           if (cubit.coursesModel!.courses!.isEmpty ||
    //               cubit.instructorsModel!.instructors!.isEmpty) {
    //             return;
    //           } else {
    //             Scaffold.of(context).showBottomSheet((context) {
    //               return const BottomFilter();
    //             });
    //           }
    //         },
    //         label: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             const Icon(
    //               Icons.filter_alt,
    //               size: 15,
    //             ),
    //             Text(AppLocalizations.of(context)!.filterData),
    //           ],
    //         ),
    //       ),
    //       body: cubit.coursesModel == null || cubit.coursesWithoutFilter == null
    //           ? const Center(
    //               child: CircularProgressIndicator(),
    //             )
    //           : cubit.coursesModel!.courses!.isEmpty
    //               ? Center(
    //                   child: Text(
    //                     'no courses !!',
    //                     style: Theme.of(context).textTheme.subtitle2?.copyWith(
    //                           color: defaultColor,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                   ),
    //                 )
    //               : Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Expanded(
    //                       child: ListView.separated(
    //                         padding: const EdgeInsets.symmetric(
    //                           vertical: 10,
    //                           horizontal: 5,
    //                         ),
    //                         physics: const BouncingScrollPhysics(),
    //                         itemBuilder: (context, index) {
    //                           return ReusableCard(
    //                             imageUrl: 'assets/images/subject.jpg',
    //                             baseText:
    //                                 '${cubit.coursesWithoutFilter![index].subject}',
    //                             secondText:
    //                                 '${cubit.coursesWithoutFilter![index].instructor}',
    //                             trailingText:
    //                                 '${'${cubit.coursesWithoutFilter![index].numberOfLectures}'} ${AppLocalizations.of(context)!.lecture}',
    //                             onCardTap: () {
    //                               navigateTo(
    //                                 widget: CourseDetailScreen(
    //                                     course:
    //                                         cubit.coursesWithoutFilter![index]),
    //                                 context: context,
    //                               );
    //                             },
    //                           );
    //                         },
    //                         separatorBuilder: (context, index) {
    //                           return const SizedBox(
    //                             height: 15,
    //                           );
    //                         },
    //                         itemCount: cubit.coursesWithoutFilter!.length,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //     );
    //   },
    // );
  }
}
