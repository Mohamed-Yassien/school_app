import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/school_cubit/cubit.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/modules/instructor_detail_screen.dart';
import 'package:school_app/shared/constants.dart';
import 'package:school_app/shared/widgets/reusable_card.dart';

import '../shared/methods.dart';

class InstructorsScreen extends StatelessWidget {
  const InstructorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolCubit, SchoolStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SchoolCubit.get(context);

        return cubit.instructorsModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : cubit.instructorsModel!.instructors!.isEmpty
                ? Center(
                    child: Text(
                      'no instructors ! start add some..',
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
                        imageUrl: 'assets/images/instructor.jpg',
                        baseText:
                            cubit.instructorsModel!.instructors![index].name!,
                        secondText: cubit.instructorsModel!.instructors![index]
                            .contractType!,
                        trailingText:
                            '${cubit.instructorsModel?.instructors?[index].salary} \$',
                        onCardTap: () {
                          navigateTo(
                              widget: InstructorDetailsScreen(
                                instructors:
                                    cubit.instructorsModel!.instructors![index],
                              ),
                              context: context);
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
                    itemCount: cubit.instructorsModel!.instructors!.length,
                  );
      },
    );
  }
}
