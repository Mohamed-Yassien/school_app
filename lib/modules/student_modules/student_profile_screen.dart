import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:school_app/cubit/student_cubit/student_cubit.dart';
import 'package:school_app/cubit/student_cubit/student_states.dart';
import 'package:school_app/shared/constants.dart';
import 'package:school_app/shared/widgets/reusable_app_bar_for_profile.dart';

import '../../shared/widgets/reusable_stack_for_profile.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = StudentCubit.get(context);

        return Scaffold(
          appBar: const ReusableAppBarForProfile(),
          body: cubit.currentStudent == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableStackForProfile(
                        icon: Icons.person,
                        name: cubit.currentStudent!.name!,
                        secondName:
                            '${cubit.currentStudent?.age!} ${AppLocalizations.of(context)!.year}',
                        imagePath: 'assets/images/student.jpg',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Text(
                          'My Courses',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: defaultColor,
                                    fontSize: 20,
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
