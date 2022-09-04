import 'package:flutter/material.dart';
import 'package:school_app/shared/constants.dart';
import 'package:school_app/shared/widgets/resuable_row_for_details.dart';
import 'package:school_app/shared/widgets/reusable_app_bar.dart';
import 'package:school_app/shared/widgets/reusable_stack_for_profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/instructors_model.dart';

class InstructorDetailsScreen extends StatelessWidget {
  final Instructors instructors;

  InstructorDetailsScreen({
    required this.instructors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReusableStackForProfile(
              icon: Icons.book,
              name: instructors.name!,
              secondName: instructors.contractType!,
              imagePath: 'assets/images/instructor.jpg',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: AppLocalizations.of(context)!.salary,
                      child: Text(
                        '${instructors.salary} ${AppLocalizations.of(context)!.moneyType}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: AppLocalizations.of(context)!.fPhone,
                      child: Text(
                        '${instructors.firstPhone}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: AppLocalizations.of(context)!.sPhone,
                      child: Text(
                        '${instructors.secondPhone}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: AppLocalizations.of(context)!.salaryType,
                      child: Text(
                        '${instructors.salaryType}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: AppLocalizations.of(context)!.contractType,
                      child: Text(
                        '${instructors.contractType}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
