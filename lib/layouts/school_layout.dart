import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/modules/add_student_screen.dart';
import 'package:school_app/shared/constants.dart';
import 'package:school_app/shared/methods.dart';

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
              cubit.titles[cubit.currentIndex],
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: defaultColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      if (cubit.currentIndex == 0)
                      {
                        navigateTo(
                          widget: const AddStudentScreenScreen(),
                          context: context,
                        );
                      }
                    },
                    icon: const Icon(Icons.add),
                    iconSize: 35,
                    color: defaultColor,
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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Students',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.accessibility_new_rounded,
                ),
                label: 'Instructors',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                ),
                label: 'Courses',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.layers_clear_sharp,
                ),
                label: 'Subjects',
              ),
            ],
          ),
        );
      },
    );
  }
}
