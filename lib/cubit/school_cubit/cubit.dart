import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/models/courses_model.dart';
import 'package:school_app/models/instructors_model.dart';
import 'package:school_app/models/plan_by_id_model.dart';
import 'package:school_app/models/plans_model.dart';
import 'package:school_app/models/student_data_model.dart';
import 'package:school_app/models/students_model.dart';
import 'package:school_app/models/subjects_model.dart';
import 'package:school_app/modules/admin_modules/plans_screen.dart';
import 'package:school_app/modules/courses_screen.dart';
import 'package:school_app/modules/admin_modules/instructors_screen.dart';
import 'package:school_app/modules/admin_modules/students_screen.dart';
import 'package:school_app/modules/student_modules/student_home_screen.dart';
import 'package:school_app/network/endpoints.dart';
import 'package:school_app/network/remote/dio_helper.dart';
import 'package:school_app/shared/widgets/reusable_toast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../modules/instructor_modules/instructor_home_screen.dart';
import '../../modules/instructor_modules/instructor_profile.dart';
import '../../modules/student_modules/student_profile_screen.dart';
import '../../services/local_notification_service.dart';

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
    PlansScreen(),
    // SubjectsScreen(),
  ];

  List<String> getTitles(context) {
    var titles = [
      AppLocalizations.of(context)!.students,
      AppLocalizations.of(context)!.instructors,
      AppLocalizations.of(context)!.courses,
      AppLocalizations.of(context)!.plans,
    ];
    return titles;
  }

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

  List<String> getStatus(context) {
    var statusList = [
      AppLocalizations.of(context)!.approved,
      AppLocalizations.of(context)!.suspended,
    ];
    return statusList;
  }

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
    emit(ClearAllDataState());
  }

  InstructorsModel? instructorsModel;
  List<String>? instructorsNames;

  String? selectedInstructor;

  changeInstructorName(String value) {
    selectedInstructor = value;
    filterCoursesListWithInstructorName(value);
    emit(SchoolChangeInstructorNameInMenuState());
  }

  void getInstructors() {
    emit(SchoolGetInstructorsLoadingState());
    DioHelper.getData(url: GET_INSTRUCTORS).then((value) {
      instructorsModel = InstructorsModel.fromJson(value.data);
      print(instructorsModel!.instructors![0].name);
      instructorsNames = List.generate(
        instructorsModel!.instructors!.length,
        (index) => instructorsModel!.instructors![index].name!,
      );
      print(instructorsNames);
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
      print(subjectsModel!.subjects![0].subject);
      emit(SchoolGetSubjectsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SchoolGetSubjectsErrorState());
    });
  }

  CoursesModel? coursesModel;
  List<Courses>? coursesWithoutFilter;

  void getCourses() {
    emit(SchoolGetCoursesLoadingState());
    DioHelper.getData(url: GET_COURSES).then((value) {
      coursesModel = CoursesModel.fromJson(value.data);
      coursesWithoutFilter = coursesModel!.courses!;
      print('val ${coursesWithoutFilter![0].instructor}');
      print('format is ${DateFormat.jm().format(
        DateTime.parse(coursesWithoutFilter![0].dates![0]),
      )}');
      emit(SchoolGetCoursesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SchoolGetCoursesErrorState());
    });
  }

  List<Courses> coursesWithInstructorNameFilter = [];

  filterCoursesListWithInstructorName(String name) {
    if (fromDate == null || toDate == null) {
      coursesWithInstructorNameFilter = [];
      for (Courses courses in coursesModel!.courses!) {
        if (courses.instructor == name) {
          print('okk');
          coursesWithInstructorNameFilter.add(courses);
          print(coursesWithInstructorNameFilter);
        } else {
          coursesWithInstructorNameFilter = [];
          emit(FilterCoursesListWithInstructorName());
        }
        coursesWithoutFilter = coursesWithInstructorNameFilter;
        emit(FilterCoursesListWithInstructorName());
      }
    } else {
      coursesWithInstructorNameFilter = [];
      for (Courses courses in coursesWithDatesFilter) {
        if (courses.instructor == name) {
          print('okk');
          coursesWithInstructorNameFilter.add(courses);
          print(coursesWithInstructorNameFilter);
        } else {
          coursesWithInstructorNameFilter = [];
          emit(FilterCoursesListWithInstructorName());
        }
        coursesWithoutFilter = coursesWithInstructorNameFilter;
        emit(FilterCoursesListWithInstructorName());
      }
    }
  }

  closeFilter() {
    coursesWithoutFilter = (fromDate == null || toDate == null)
        ? coursesModel!.courses
        : coursesWithDatesFilter;
    selectedInstructor = null;
    emit(CloseFilterCoursesListWithInstructorName());
    if (fromDate != null && toDate != null) {
      filterCoursesWithDates();
    }
  }

  String? fromDateController;
  DateTime? fromDate;
  DateTime? toDate = DateTime.now();
  String toDateController = DateFormat.yMd().format(DateTime.now());
  List<Courses> coursesWithDatesFilter = [];

  changeFromDateContainerString(String val) {
    fromDateController = val;
    emit(ChangeFromDateContainerValueState());
  }

  changeToDateContainerString(String val) {
    toDateController = val;
    emit(ChangeToDateContainerValueState());
  }

  filterCoursesWithDates() {
    if (fromDate != null && selectedInstructor == null) {
      coursesWithDatesFilter = [];
      for (Courses courses in coursesModel!.courses!) {
        print('from is $fromDate');
        print('to is $toDate');
        if ((DateTime.parse(courses.firstSectionDate!) == fromDate) ||
            (DateTime.parse(courses.firstSectionDate!).isAfter(fromDate!))) {
          print('ha');
          print(DateTime.parse(courses.firstSectionDate!));
          for (String date in courses.dates!) {
            if ((DateTime.parse(date) == toDate ||
                DateTime.parse(date).isBefore(
                  toDate!,
                ))) {
              if (coursesWithDatesFilter
                  .every((item) => item.id != courses.id)) {
                coursesWithDatesFilter.add(courses);
                print('go on');
              }
            }
            // else {
            //   print('go out');
            //   coursesWithDatesFilter = [];
            // }
          }
        }
        coursesWithoutFilter = coursesWithDatesFilter;
        emit(FilterCoursesListWithDates());
      }
    } else if (fromDate != null && selectedInstructor != null) {
      coursesWithDatesFilter = [];
      for (Courses courses in coursesWithInstructorNameFilter) {
        print('in instructor list');
        print('from is $fromDate');
        print('to is $toDate');
        if ((DateTime.parse(courses.firstSectionDate!) == fromDate) ||
            (DateTime.parse(courses.firstSectionDate!).isAfter(fromDate!))) {
          print('ha');
          print(DateTime.parse(courses.firstSectionDate!));
          for (String date in courses.dates!) {
            if ((DateTime.parse(date) == toDate ||
                DateTime.parse(date).isBefore(
                  toDate!,
                ))) {
              if (coursesWithDatesFilter
                  .every((item) => item.id != courses.id)) {
                coursesWithDatesFilter.add(courses);
                print('go on');
              }
            }
            // else {
            //   print('go out');
            //   coursesWithDatesFilter = [];
            // }
          }
        }
        coursesWithoutFilter = coursesWithDatesFilter;
        emit(FilterCoursesListWithDates());
      }
    }
  }

  closeDatesFilter() {
    fromDate = null;
    toDate = DateTime.now();
    coursesWithoutFilter = selectedInstructor == null
        ? coursesModel!.courses
        : coursesWithInstructorNameFilter;
    fromDateController = 'From';
    toDateController = DateFormat.yMd().format(DateTime.now());
    emit(CloseFilterCoursesListWithDates());
    if (selectedInstructor != null) {
      filterCoursesListWithInstructorName(selectedInstructor!);
    }
  }

  PlansModel? plansModel;

  getPlans() async {
    emit(SchoolGetPlansLoadingState());
    DioHelper.getData(url: GET_PLANS).then((value) {
      plansModel = PlansModel.fromJson(value.data);
      print(plansModel?.plans?[0].startDate);
      emit(SchoolGetPlansSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SchoolGetPlansErrorState());
    });
  }

  PlanByIdModel? planByIdModel;

  getPlanById(int id) async {
    emit(SchoolGetPlanByIdLoadingState());
    DioHelper.getData(url: '$GET_PLAN_BY_ID$id').then((value) {
      planByIdModel = PlanByIdModel.fromJson(value.data);
      print(planByIdModel?.planName);
      emit(SchoolGetPlanByIdSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SchoolGetPlanByIdErrorState());
    });
  }

  initNotification() async {
    await LocalNotificationService.initialize();
  }

  /////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////
  // student part

  int studentNavCurrentIndex = 0;

  changeStudentBottomNavIndex(int index) {
    studentNavCurrentIndex = index;
    if (index == 1) {
      getCurrentStudent(
        // CacheHelper.getData(key: 'currentStudentId') ?? 1,
        1,
      );
    }
    emit(SchoolChangeStudentBottomNavState());
  }

  List<Widget> studentScreens = const [
    StudentHomeScreen(),
    StudentProfileScreen(),
  ];

  Students? currentStudent;

  getCurrentStudent(int id) {
    currentStudent = studentsModel?.students?.firstWhere(
      (element) => element.id == id,
    );
  }

  /////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
// Instructor Part

  int instructorNavCurrentIndex = 0;

  changeInstructorBottomNavIndex(int index) {
    instructorNavCurrentIndex = index;
    // if (index == 1) {
    //   getCurrentStudent(
    //     CacheHelper.getData(key: 'currentStudentId'),
    //   );
    // }
    emit(SchoolChangeInstructorBottomNavState());
  }

  List<Widget> instructorScreens = const [
    InstructorHomeScreen(),
    InstructorProfileScreen(),
  ];
}
