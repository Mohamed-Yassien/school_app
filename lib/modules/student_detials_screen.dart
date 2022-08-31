import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app/models/students_model.dart';
import 'package:school_app/shared/constants.dart';
import 'package:school_app/shared/widgets/resuable_row_for_details.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Students students;

  StudentDetailsScreen({
    required this.students,
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
                                          'assets/images/student.jpg'),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${students.name}',
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
                                          Icons.person,
                                          size: 18,
                                          color: defaultColor,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '${students.age} years',
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
