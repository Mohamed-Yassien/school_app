import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/school_cubit/cubit.dart';
import 'package:school_app/cubit/school_cubit/states.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:school_app/shared/widgets/reusable_button.dart';

class PlanDetailsScreen extends StatelessWidget {
  const PlanDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolCubit, SchoolStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SchoolCubit.get(context);

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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${cubit.planByIdModel?.planName}',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                      backgroundColor: Colors.white,
                      label: Text(
                        '${cubit.planByIdModel?.price} ${AppLocalizations.of(context)!.moneyType}',
                      ),
                      padding:const EdgeInsets.all(10),
                      labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.teal,
                        fontSize: 18,
                      ),
                    ),
                    Chip(
                      backgroundColor: Colors.white,
                      label: Text(
                        '${cubit.planByIdModel?.discount} %',
                      ),
                      padding: const EdgeInsets.all(10),
                      labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.teal,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                  const SizedBox(
                    height: 25,
                  ),
                  reusableButton(
                    text: AppLocalizations.of(context)!.subscribe,
                    function: () {},
                    buttonColor: Colors.white,
                    radius: 25,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
