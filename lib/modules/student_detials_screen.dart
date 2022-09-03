import 'package:flutter/material.dart';
import 'package:school_app/models/students_model.dart';
import 'package:school_app/shared/constants.dart';
import 'package:school_app/shared/widgets/resuable_row_for_details.dart';
import 'package:school_app/shared/widgets/reusable_app_bar.dart';
import 'package:school_app/shared/widgets/reusable_stack_for_profile.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Students students;

  StudentDetailsScreen({
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReusableStackForProfile(
              icon: Icons.person,
              name: students.name!,
              secondName: '${students.age!} years',
              imagePath: 'assets/images/student.jpg',
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
                      baseName: 'phone',
                      child: Text(
                        '${students.firstPhone}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: 'phone',
                      child: Text(
                        '${students.secondPhone}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: 'sitting number',
                      child: Text(
                        '${students.sittingNumber}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: 'class room',
                      child: Text(
                        '${students.classroom}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: 'class room',
                      child: Text(
                        '${students.classroom}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: 'class room',
                      child: Text(
                        '${students.classroom}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: defaultColor,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: 'national id',
                      child: Text(
                        '${students.studentNationalId}',
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
