import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/student_cubit/student_states.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/student_data_model.dart';
import '../../models/students_model.dart';
import '../../modules/student_modules/contact_screen.dart';
import '../../modules/student_modules/student_home_screen.dart';
import '../../modules/student_modules/student_profile_screen.dart';
import '../../network/endpoints.dart';
import '../../network/local/cache_helper.dart';
import '../../network/remote/dio_helper.dart';
import '../../shared/widgets/reusable_toast.dart';

class StudentCubit extends Cubit<StudentStates> {
  StudentCubit() : super(StudentInitialState());

  static StudentCubit get(context) => BlocProvider.of(context);

  StudentsModel? studentsModel;

  void getStudents() {
    emit(GetStudentsLoadingState());
    DioHelper.getData(url: GET_STUDENTS).then((value) {
      studentsModel = StudentsModel.fromJson(value.data);
      print(studentsModel!.students![0].name);
      emit(GetStudentsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetStudentsErrorState());
    });
  }

  String? selectedStatus;

  List<String> getStatus(context) {
    var statusList = <String>[
      AppLocalizations.of(context)!.approved,
      AppLocalizations.of(context)!.suspended,
    ];
    return statusList;
  }

  changeStatusName(String value) {
    selectedStatus = value;
    emit(ChangeStudentStatusNameInListState());
  }

  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var dateController = TextEditingController();
  var roomController = TextEditingController();
  var gNameController = TextEditingController();
  var gJobController = TextEditingController();
  var fPhoneController = TextEditingController();
  var sPhoneController = TextEditingController();
  var nationalIDController = TextEditingController();
  var cityController = TextEditingController();
  var sittingController = TextEditingController();
  var notesController = TextEditingController();

  DateTime? dateTime;

  void addNewStudent() {
    Student student = Student(
      name: nameController.text,
      age: ageController.text,
      date: dateTime,
      classroom: roomController.text,
      guardian_name: gNameController.text,
      guardian_job: gJobController.text,
      first_phone: fPhoneController.text,
      second_phone: sPhoneController.text,
      student_national_id: nationalIDController.text,
      city: cityController.text,
      sitting_number: sittingController.text,
      notes: notesController.text,
      status: selectedStatus,
    );
    print(student.toJson());
    emit(AddNewStudentLoadingState());
    DioHelper.post(
      url: ADD_STUDENT,
      body: student.toJson(),
      haveFile: true,
    ).then(
      (value) {
        print('value is ${value.data}');
        clearAllData();
        getStudents();
        showToast(
          msg: 'student created',
          toastStates: ToastStates.SUCCESS,
        );
        emit(AddNewStudentSuccessState());
      },
    ).catchError((e) {
      print(e.toString());
      emit(AddNewStudentErrorState());
    });
  }

  void clearAllData() {
    nameController.clear();
    ageController.clear();
    dateController.clear();
    roomController.clear();
    gNameController.clear();
    gJobController.clear();
    fPhoneController.clear();
    sPhoneController.clear();
    nationalIDController.clear();
    cityController.clear();
    sittingController.clear();
    notesController.clear();
    dateTime = null;
    selectedStatus = null;
    emit(ClearAllStudentDataState());
  }

  int studentNavCurrentIndex = 0;

  changeStudentBottomNavIndex(int index) {
    studentNavCurrentIndex = index;
    if (index == 1) {
      getCurrentStudent(
        CacheHelper.getData(key: 'currentStudentId') ?? 1,
      );
    }
    emit(ChangeStudentBottomNavState());
  }

  List<Widget> studentScreens = const [
    StudentHomeScreen(),
    StudentProfileScreen(),
    ContactScreen(),
  ];

  Students? currentStudent;

  getCurrentStudent(int id) {
    currentStudent = studentsModel?.students?.firstWhere(
      (element) => element.id == id,
    );
  }
}
