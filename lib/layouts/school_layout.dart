import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/modules/add_student_screen.dart';
import 'package:school_app/shared/constants.dart';
import 'package:school_app/shared/methods.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:school_app/shared/widgets/language_change_drop.dart';

import '../cubit/school_cubit/cubit.dart';

class SchoolLayOut extends StatelessWidget {
  const SchoolLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolCubit, SchoolStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SchoolCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.getTitles(context)[cubit.currentIndex],
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                fontSize: 20,
                  ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (cubit.currentIndex == 0) {
                          navigateTo(
                            widget: const AddStudentScreenScreen(),
                            context: context,
                          );
                        }
                      },
                      icon: const Icon(Icons.add),
                      iconSize: 25,
                      color: Colors.teal,
                    ),
                    const SizedBox(width: 25,),
                    LanguageChangeDrop(
                      margin: 0,
                      fillColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottomNavIndex(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person,
                ),
                label: AppLocalizations.of(context)!.students,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.accessibility_new_rounded,
                ),
                label: AppLocalizations.of(context)!.instructors,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.book,
                ),
                label: AppLocalizations.of(context)!.courses,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.layers_clear_sharp,
                ),
                label: AppLocalizations.of(context)!.subjects,
              ),
            ],
          ),
        );
      },
    );
  }
}
