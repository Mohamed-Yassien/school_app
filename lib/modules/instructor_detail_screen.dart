import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app/shared/constants.dart';
import 'package:school_app/shared/widgets/resuable_row_for_details.dart';

import '../models/instructors_model.dart';

class InstructorDetailsScreen extends StatelessWidget {
  final Instructors instructors;

  InstructorDetailsScreen({
    required this.instructors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: defaultColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultColor,
          statusBarIconBrightness: Brightness.light,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 7,
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ),
        title: Text(
          'PROFILE',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_note_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *.4,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: defaultColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    right: 50,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 25),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.grey[300],
                                      backgroundImage: const AssetImage(
                                          'assets/images/instructor.jpg'),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${instructors.name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1,
                                    ),

                                    const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Divider(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.book,
                                          size: 18,
                                          color: defaultColor,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '${instructors.contractType}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.copyWith(
                                            color: defaultColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      baseName: 'salary',
                      child: Text(
                        '${instructors.salary} \$',
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
                      baseName: 'phone',
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
                      baseName: 'salary type',
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
                      baseName: 'contract type',
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
