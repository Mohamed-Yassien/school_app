import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/school_cubit/cubit.dart';
import '../cubit/school_cubit/states.dart';
import '../shared/constants.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolCubit, SchoolStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SchoolCubit.get(context);

        return cubit.subjectsModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : cubit.subjectsModel!.subjects!.isEmpty
                ? Center(
                    child: Text(
                      'no subjects ! start add some..',
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
                      return InkWell(
                        onTap: () {
                          // // navigateTo(
                          // //     widget: InstructorDetailsScreen(
                          // //       subjects:
                          // //           cubit.subjectsModel!.instructors![index],
                          // //     ),
                          //     context: context);
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                              left: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    backgroundImage: const AssetImage(
                                      'assets/images/subject.jpg',
                                    ),
                                    radius: 35,
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.subjectsModel!
                                              .subjects![index].subject!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cubit
                                              .subjectsModel!
                                              .subjects![index]
                                              .description!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
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
