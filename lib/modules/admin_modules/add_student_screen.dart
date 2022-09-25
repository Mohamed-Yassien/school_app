import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/cubit/student_cubit/student_cubit.dart';
import 'package:school_app/cubit/student_cubit/student_states.dart';
import 'package:school_app/shared/constants.dart';
import 'package:school_app/shared/widgets/resuable_row_for_details.dart';
import 'package:school_app/shared/widgets/reusable_text_field.dart';
import 'package:school_app/shared/widgets/reusable_toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddStudentScreenScreen extends StatelessWidget {
  const AddStudentScreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentStates>(
      listener: (context, state) {
        if (state is AddNewStudentSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = StudentCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.addStudent,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: defaultColor,
                  ),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: defaultColor,
              iconSize: 30,
              onPressed: () {
                cubit.clearAllData();
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ReusableTextField(
                      textLabel: AppLocalizations.of(context)!.studentName,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'name must not be empty';
                        }
                      },
                      type: TextInputType.name,
                      onChange: (String value) {},
                      controller: cubit.nameController,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ReusableTextField(
                            textLabel: AppLocalizations.of(context)!.studentAge,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'age must not be empty';
                              }
                            },
                            type: TextInputType.number,
                            onChange: (String value) {},
                            controller: cubit.ageController,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ReusableTextField(
                            textLabel: AppLocalizations.of(context)!.classRoom,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'classRoom must not be empty';
                              }
                            },
                            type: TextInputType.number,
                            onChange: (String value) {},
                            controller: cubit.roomController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ReusableTextField(
                      textLabel: AppLocalizations.of(context)!.studentDate,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'date must not be empty';
                        }
                      },
                      type: TextInputType.datetime,
                      onChange: (String value) {},
                      controller: cubit.dateController,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                        ).then(
                          (dateValue) {
                            if (dateValue != null) {
                              cubit.dateTime = dateValue;
                              cubit.dateController.text =
                                  DateFormat.yMd().format(dateValue);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ReusableTextField(
                      textLabel: AppLocalizations.of(context)!.gName,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'guardian name must not be empty';
                        }
                      },
                      type: TextInputType.name,
                      onChange: (String value) {},
                      controller: cubit.gNameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ReusableTextField(
                      textLabel: AppLocalizations.of(context)!.gJob,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'guardian job must not be empty';
                        }
                      },
                      type: TextInputType.text,
                      onChange: (String value) {},
                      controller: cubit.gJobController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ReusableTextField(
                      textLabel: AppLocalizations.of(context)!.fPhone,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'first phone must not be empty';
                        }
                      },
                      type: TextInputType.phone,
                      onChange: (String value) {},
                      controller: cubit.fPhoneController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ReusableTextField(
                      textLabel: AppLocalizations.of(context)!.sPhone,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'second phone must not be empty';
                        }
                      },
                      type: TextInputType.phone,
                      onChange: (String value) {},
                      controller: cubit.sPhoneController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ReusableTextField(
                      textLabel: AppLocalizations.of(context)!.nationalId,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'national id must not be empty';
                        }
                      },
                      type: TextInputType.number,
                      onChange: (String value) {},
                      controller: cubit.nationalIDController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ReusableTextField(
                      textLabel: AppLocalizations.of(context)!.studentCity,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'student city must not be empty';
                        }
                      },
                      type: TextInputType.text,
                      onChange: (String value) {},
                      controller: cubit.cityController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ReusableTextField(
                      textLabel: AppLocalizations.of(context)!.sittingNumber,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'sitting number must not be empty';
                        }
                      },
                      type: TextInputType.number,
                      onChange: (String value) {},
                      controller: cubit.sittingController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ReusableTextField(
                      textLabel: AppLocalizations.of(context)!.notes,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'notes must not be empty';
                        }
                      },
                      type: TextInputType.text,
                      maxLines: 3,
                      onChange: (String value) {},
                      controller: cubit.notesController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: reusableRowForTaskDetails(
                      fillColor: false,
                      baseName: AppLocalizations.of(context)!.status,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          iconSize: 35,
                          iconEnabledColor: Colors.teal,
                          iconDisabledColor: Colors.teal,
                          value: cubit.selectedStatus,
                          items: List.generate(
                            cubit.getStatus(context).length,
                            (index) => DropdownMenuItem<String>(
                              value: cubit.getStatus(context)[index],
                              child: Text(
                                cubit.getStatus(context)[index],
                                style: const TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          onChanged: (val) {
                            cubit.changeStatusName(val!);
                          },
                          isExpanded: true,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ),
                  state is AddNewStudentLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 40,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.teal,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: OutlinedButton(
                              onPressed: () {
                                if (cubit.nameController.text.isEmpty) {
                                  showToast(
                                      msg: 'name must not be empty',
                                      toastStates: ToastStates.ERROR);
                                  return;
                                }
                                if (cubit.nationalIDController.text.isEmpty) {
                                  showToast(
                                      msg: 'national id must not be empty',
                                      toastStates: ToastStates.ERROR);
                                  return;
                                }
                                cubit.addNewStudent();
                              },
                              child: Text(
                                AppLocalizations.of(context)!.saveStudent,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
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
