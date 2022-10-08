import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/cubit/courses_cubit/courses_states.dart';
import 'package:school_app/models/courses_model.dart';

import '../../network/endpoints.dart';
import '../../network/remote/dio_helper.dart';
import '../instructor_cubit/instructor_cubit.dart';

class CoursesCubit extends Cubit<CoursesStates> {
  final InstructorCubit instructorCubit;

  CoursesCubit({
    required this.instructorCubit,
  }) : super(CoursesInitialState());

  static CoursesCubit get(context) => BlocProvider.of(context);

  CoursesModel? coursesModel;
  List<Courses>? coursesWithoutFilter;

  void getCourses() {
    emit(GetCoursesLoadingState());
    DioHelper.getData(url: GET_COURSES).then((value) {
      coursesModel = CoursesModel.fromJson(value.data);
      coursesWithoutFilter = coursesModel!.courses!;

      emit(GetCoursesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCoursesErrorState());
    });
  }

  /////////////////////

  List<Courses> coursesWithInstructorNameFilter = [];

  changeInstructorName(String value) {
    instructorCubit.selectedInstructor = value;
    filterCoursesListWithInstructorName(value);
    emit(SchoolChangeInstructorNameInMenuStateInCoursesCubit());
  }

  filterCoursesListWithInstructorName(String name) {
    print('1');
    if (fromDate == null || toDate == null) {
      coursesWithInstructorNameFilter = [];
      for (Courses courses in coursesModel!.courses!) {
        if (courses.instructor == name) {
          coursesWithInstructorNameFilter.add(courses);
        } else {
          coursesWithInstructorNameFilter = [];
          emit(FilterCoursesListWithInstructorNameInCoursesCubit());
        }
        coursesWithoutFilter = coursesWithInstructorNameFilter;
        emit(FilterCoursesListWithInstructorNameInCoursesCubit());
      }
    } else {
      coursesWithInstructorNameFilter = [];
      for (Courses courses in coursesWithDatesFilter) {
        if (courses.instructor == name) {
          coursesWithInstructorNameFilter.add(courses);
        } else {
          coursesWithInstructorNameFilter = [];
          emit(FilterCoursesListWithInstructorNameInCoursesCubit());
        }
        coursesWithoutFilter = coursesWithInstructorNameFilter;
        emit(FilterCoursesListWithInstructorNameInCoursesCubit());
      }
    }
  }

  closeFilter() {
    print('2');
    coursesWithoutFilter = (fromDate == null || toDate == null)
        ? coursesModel!.courses
        : coursesWithDatesFilter;
    instructorCubit.selectedInstructor = null;
    emit(CloseFilterCoursesListWithInstructorNameInCoursesCubit());
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
    emit(ChangeFromDateContainerValueStateInCoursesCubit());
  }

  changeToDateContainerString(String val) {
    toDateController = val;
    emit(ChangeToDateContainerValueStateInCoursesCubit());
  }

  filterCoursesWithDates() {
    if (fromDate != null && instructorCubit.selectedInstructor == null) {
      coursesWithDatesFilter = [];
      for (Courses courses in coursesModel!.courses!) {
        if ((DateTime.parse(courses.firstSectionDate!) == fromDate) ||
            (DateTime.parse(courses.firstSectionDate!).isAfter(fromDate!))) {
          for (String date in courses.dates!) {
            if ((DateTime.parse(date) == toDate ||
                DateTime.parse(date).isBefore(
                  toDate!,
                ))) {
              if (coursesWithDatesFilter
                  .every((item) => item.id != courses.id)) {
                coursesWithDatesFilter.add(courses);
              }
            }
          }
        }
        coursesWithoutFilter = coursesWithDatesFilter;
        emit(FilterCoursesListWithDatesInCoursesCubit());
      }
    } else if (fromDate != null && instructorCubit.selectedInstructor != null) {
      coursesWithDatesFilter = [];
      for (Courses courses in coursesWithInstructorNameFilter) {
        if ((DateTime.parse(courses.firstSectionDate!) == fromDate) ||
            (DateTime.parse(courses.firstSectionDate!).isAfter(fromDate!))) {
          for (String date in courses.dates!) {
            if ((DateTime.parse(date) == toDate ||
                DateTime.parse(date).isBefore(
                  toDate!,
                ))) {
              if (coursesWithDatesFilter
                  .every((item) => item.id != courses.id)) {
                coursesWithDatesFilter.add(courses);
              }
            }
          }
        }
        coursesWithoutFilter = coursesWithDatesFilter;
        emit(FilterCoursesListWithDatesInCoursesCubit());
      }
    }
  }

  closeDatesFilter() {
    fromDate = null;
    toDate = DateTime.now();
    coursesWithoutFilter = instructorCubit.selectedInstructor == null
        ? coursesModel!.courses
        : coursesWithInstructorNameFilter;
    fromDateController = null;
    toDateController = DateFormat.yMd().format(DateTime.now());
    emit(CloseFilterCoursesListWithDatesInCoursesCubit());
    if (instructorCubit.selectedInstructor != null) {
      filterCoursesListWithInstructorName(instructorCubit.selectedInstructor!);
    }
  }
}
