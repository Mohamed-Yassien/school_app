import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/school_cubit/cubit.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/modules/admin_modules/plan_details_screen.dart';
import 'package:school_app/shared/methods.dart';

import '../../shared/constants.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolCubit, SchoolStates>(
      listener: (context, state) {
        if (state is SchoolGetPlanByIdSuccessState) {
          navigateTo(
            widget: const PlanDetailsScreen(),
            context: context,
          );
        }
      },
      builder: (context, state) {
        var cubit = SchoolCubit.get(context);

        return Scaffold(
          body: cubit.coursesModel == null || cubit.coursesWithoutFilter == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : cubit.coursesModel!.courses!.isEmpty
                  ? Center(
                      child: Text(
                        'no plans !!',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 5,
                              ),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    cubit.getPlanById(
                                      cubit.plansModel!.plans![index].id!,
                                    );
                                  },
                                  child: Card(
                                    elevation: 15,
                                    color: Colors.teal,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: Colors.transparent,
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                        vertical: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${cubit.plansModel?.plans?[index].planName}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 18,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Chip(
                                            backgroundColor: Colors.white,
                                            label: Text(
                                              '${cubit.plansModel?.plans?[index].price} ${AppLocalizations.of(context)!.moneyType}',
                                            ),
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: Colors.teal,
                                                ),
                                          ),
                                          Chip(
                                            backgroundColor: Colors.white,
                                            label: Text(
                                              '${cubit.plansModel?.plans?[index].discount} %',
                                            ),
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: Colors.teal,
                                                ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  '${cubit.plansModel?.plans?[index].startDate}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                ),
                                                Text(
                                                  '${cubit.plansModel?.plans?[index].endDate}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
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
                              itemCount: cubit.plansModel!.plans!.length,
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
