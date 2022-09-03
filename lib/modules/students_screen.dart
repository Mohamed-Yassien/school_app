import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/school_cubit/cubit.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/modules/student_detials_screen.dart';
import 'package:school_app/shared/constants.dart';
import 'package:school_app/shared/methods.dart';
import 'package:school_app/shared/widgets/reusable_card.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolCubit, SchoolStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SchoolCubit.get(context);

        return cubit.studentsModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : cubit.studentsModel!.students!.isEmpty
                ? Center(
                    child: Text(
                      'no students ! start add some..',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: defaultColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
                : ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ReusableCard(
                        imageUrl: 'assets/images/student.jpg',
                        baseText: cubit.studentsModel!.students![index].name!,
                        secondText:
                            '${cubit.studentsModel?.students?[index].city}',
                        trailingText:
                            '${cubit.studentsModel?.students?[index].status}',
                        onCardTap: () {
                          navigateTo(
                            widget: StudentDetailsScreen(
                              students: cubit.studentsModel!.students![index],
                            ),
                            context: context,
                          );
                        },
                        boxShape: BoxShape.circle,
                        isStudent: true,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: cubit.studentsModel!.students!.length,
                  );
      },
    );
  }
}
