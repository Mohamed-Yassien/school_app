import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cubit/school_cubit/cubit.dart';
import '../cubit/school_cubit/states.dart';

class InstructorLayout extends StatelessWidget {
  const InstructorLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolCubit, SchoolStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SchoolCubit.get(context);
        return Scaffold(
          body: cubit.instructorScreens[cubit.instructorNavCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeInstructorBottomNavIndex(index);
            },
            currentIndex: cubit.instructorNavCurrentIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.book,
                ),
                label: AppLocalizations.of(context)!.courses,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person,
                ),
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}
