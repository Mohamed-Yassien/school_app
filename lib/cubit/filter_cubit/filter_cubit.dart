import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:school_app/cubit/filter_cubit/filter_states.dart';

import '../../models/courses_model.dart';
import '../courses_cubit/courses_cubit.dart';
import '../instructor_cubit/instructor_cubit.dart';

class FilterCubit extends Cubit<FilterStates> {
  final CoursesCubit coursesCubit;
  final InstructorCubit instructorCubit;

  FilterCubit({
    required this.coursesCubit,
    required this.instructorCubit,
  }) : super(FilterInitialState());

  static FilterCubit get(context) => BlocProvider.of(context);

  List<Courses> coursesWithInstructorNameFilter = [];

  changeInstructorName(String value) {
    instructorCubit.selectedInstructor = value;
    filterCoursesListWithInstructorName(value);
    emit(SchoolChangeInstructorNameInMenuStateInFilterCubit());
  }

  filterCoursesListWithInstructorName(String name) {
    if (fromDate == null || toDate == null) {
      coursesWithInstructorNameFilter = [];
      for (Courses courses in coursesCubit.coursesModel!.courses!) {
        if (courses.instructor == name) {
          print('okk');
          coursesWithInstructorNameFilter.add(courses);
          print(coursesWithInstructorNameFilter);
        } else {
          coursesWithInstructorNameFilter = [];
          emit(FilterCoursesListWithInstructorNameInFilterCubit());
        }
        coursesCubit.coursesWithoutFilter = coursesWithInstructorNameFilter;
        emit(FilterCoursesListWithInstructorNameInFilterCubit());
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
          emit(FilterCoursesListWithInstructorNameInFilterCubit());
        }
        coursesCubit.coursesWithoutFilter = coursesWithInstructorNameFilter;
        emit(FilterCoursesListWithInstructorNameInFilterCubit());
      }
    }
  }

  closeFilter() {
    coursesCubit.coursesWithoutFilter = (fromDate == null || toDate == null)
        ? coursesCubit.coursesModel!.courses
        : coursesWithDatesFilter;
    instructorCubit.selectedInstructor = null;
    emit(CloseFilterCoursesListWithInstructorNameInFilterCubit());
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
    emit(ChangeFromDateContainerValueStateInFilterCubit());
  }

  changeToDateContainerString(String val) {
    toDateController = val;
    emit(ChangeToDateContainerValueStateInFilterCubit());
  }

  filterCoursesWithDates() {
    if (fromDate != null && instructorCubit.selectedInstructor == null) {
      coursesWithDatesFilter = [];
      for (Courses courses in coursesCubit.coursesModel!.courses!) {
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
        coursesCubit.coursesWithoutFilter = coursesWithDatesFilter;
        emit(FilterCoursesListWithDatesInFilterCubit());
      }
    } else if (fromDate != null && instructorCubit.selectedInstructor != null) {
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
        coursesCubit.coursesWithoutFilter = coursesWithDatesFilter;
        emit(FilterCoursesListWithDatesInFilterCubit());
      }
    }
  }

  closeDatesFilter() {
    fromDate = null;
    toDate = DateTime.now();
    coursesCubit.coursesWithoutFilter = instructorCubit.selectedInstructor == null
        ? coursesCubit.coursesModel!.courses
        : coursesWithInstructorNameFilter;
    fromDateController = null;
    toDateController = DateFormat.yMd().format(DateTime.now());
    emit(CloseFilterCoursesListWithDatesInFilterCubit());
    if (instructorCubit.selectedInstructor != null) {
      filterCoursesListWithInstructorName(instructorCubit.selectedInstructor!);
    }
  }
}
