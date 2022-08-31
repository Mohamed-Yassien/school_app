import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/models/courses_model.dart';
import 'package:school_app/models/instructors_model.dart';
import 'package:school_app/models/student_data_model.dart';
import 'package:school_app/models/students_model.dart';
import 'package:school_app/models/subjects_model.dart';
import 'package:school_app/modules/courses_screen.dart';
import 'package:school_app/modules/instructors_screen.dart';
import 'package:school_app/modules/students_screen.dart';
import 'package:school_app/modules/subjects_screen.dart';
import 'package:school_app/network/endpoints.dart';
import 'package:school_app/network/remote/dio_helper.dart';
import 'package:school_app/shared/widgets/reusable_toast.dart';

class SchoolCubit extends Cubit<SchoolStates> {
  SchoolCubit() : super(SchoolInitialState());

  static SchoolCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(SchoolChangeBottomNavState());
  }

  List<Widget> screens = const [
    StudentsScreen(),
    InstructorsScreen(),
    CoursesScreen(),
    SubjectsScreen(),
  ];

  List<String> titles = [
    'Students',
    'Instructors',
    'Courses',
    'Subjects',
  ];

  StudentsModel? studentsModel;

  void getStudents() {
    emit(SchoolGetStudentsLoadingState());
    DioHelper.getData(url: GET_STUDENTS).then((value) {
      studentsModel = StudentsModel.fromJson(value.data);
      print(studentsModel!.students![0].name);
      emit(SchoolGetStudentsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SchoolGetStudentsErrorState());
    });
  }

  String? selectedStatus;
  List<String> statusList = ['Approved', 'Suspended'];

  changeStatusName(String value) {
    selectedStatus = value;
    emit(ChangeStatusNameInListState());
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
    DioHelper.post(url: ADD_STUDENT, body: student.toJson(), haveFile: true)
        .then(
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
    emit(ClearAllDataState());
  }

  InstructorsModel? instructorsModel;

  void getInstructors() {
    emit(SchoolGetInstructorsLoadingState());
    DioHelper.getData(url: GET_INSTRUCTORS).then((value) {
      instructorsModel = InstructorsModel.fromJson(value.data);
      print(studentsModel!.students![0].name);
      emit(SchoolGetInstructorsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SchoolGetInstructorsErrorState());
    });
  }

  SubjectsModel? subjectsModel;

  void getSubjects() {
    emit(SchoolGetSubjectsLoadingState());
    DioHelper.getData(url: GET_SUBJECTS).then((value) {
      subjectsModel = SubjectsModel.fromJson(value.data);
      print(studentsModel!.students![0].name);
      emit(SchoolGetSubjectsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SchoolGetSubjectsErrorState());
    });
  }


  CoursesModel? coursesModel;

  void getCourses() {
    emit(SchoolGetCoursesLoadingState());
    DioHelper.getData(url: GET_COURSES).then((value) {
      coursesModel = CoursesModel.fromJson(value.data);
      print(studentsModel!.students![0].name);
      emit(SchoolGetCoursesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SchoolGetCoursesErrorState());
    });
  }
}
