import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/cubit/school_cubit/states.dart';
import 'package:school_app/models/courses_model.dart';
import 'package:school_app/models/instructors_model.dart';
import 'package:school_app/modules/admin_modules/plans_screen.dart';
import 'package:school_app/modules/courses_screen.dart';
import 'package:school_app/modules/admin_modules/instructors_screen.dart';
import 'package:school_app/modules/admin_modules/students_screen.dart';
import 'package:school_app/network/endpoints.dart';
import 'package:school_app/network/remote/dio_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../modules/instructor_modules/instructor_home_screen.dart';
import '../../modules/instructor_modules/instructor_profile.dart';
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
    fromDateController = null;
    toDateController = DateFormat.yMd().format(DateTime.now());
    emit(CloseFilterCoursesListWithDates());
    if (selectedInstructor != null) {
      filterCoursesListWithInstructorName(selectedInstructor!);
    }
  }

  initNotification() async {
    await LocalNotificationService.initialize();
  }

  /////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
// Instructor Part

  int instructorNavCurrentIndex = 0;

  changeInstructorBottomNavIndex(int index) {
    instructorNavCurrentIndex = index;
    emit(SchoolChangeInstructorBottomNavState());
  }

  List<Widget> instructorScreens = const [
    InstructorHomeScreen(),
    InstructorProfileScreen(),
  ];
}
