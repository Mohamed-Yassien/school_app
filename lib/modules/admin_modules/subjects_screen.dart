import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/subject_cubit/subject_cubit.dart';
import 'package:school_app/cubit/subject_cubit/subject_states.dart';
import 'package:school_app/shared/widgets/reusable_card.dart';

import '../../shared/constants.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubjectCubit, SubjectsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SubjectCubit.get(context);

        return cubit.subjectsModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : cubit.subjectsModel!.subjects!.isEmpty
                ? Center(
                    child: Text(
                      'no subjects !!',
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
                        imageUrl: 'assets/images/subject.jpg',
                        baseText:
                            cubit.subjectsModel!.subjects![index].subject!,
                        secondText:
                            cubit.subjectsModel!.subjects![index].description!,
                        trailingText: '',
                        onCardTap: () {},
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: cubit.subjectsModel!.subjects!.length,
                  );
      },
    );
  }
}
