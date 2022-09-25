import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/plans_cubit/plans_cubit.dart';
import 'package:school_app/cubit/plans_cubit/plans_states.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:school_app/shared/widgets/reusable_button.dart';
import 'package:school_app/shared/widgets/reusable_divider.dart';

import '../../shared/widgets/reusable_row_for_plan_details.dart';

class PlanDetailsScreen extends StatelessWidget {
  const PlanDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlansCubit, PlansStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PlansCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.teal,
              statusBarIconBrightness: Brightness.light,
            ),
            backgroundColor: Colors.teal,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 25,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.teal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${cubit.planByIdModel?.planName}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                            textAlign: TextAlign.start,
                          ),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          const ReusableDivider(),
                          ReusableRowForPlanDetails(
                            baseText: AppLocalizations.of(context)!.plan_price,
                            subText:
                                '${cubit.planByIdModel?.price} ${AppLocalizations.of(context)!.moneyType}',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ReusableRowForPlanDetails(
                            baseText:
                                AppLocalizations.of(context)!.plan_discount,
                            subText: '${cubit.planByIdModel?.discount} %',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ReusableRowForPlanDetails(
                            baseText: AppLocalizations.of(context)!
                                .plan_available_date,
                            subText: '${cubit.planByIdModel?.endDate}',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                reusableButton(
                  text: AppLocalizations.of(context)!.subscribe,
                  function: () {},
                  buttonColor: Colors.white,
                  radius: 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
