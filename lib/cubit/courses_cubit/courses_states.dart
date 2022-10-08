abstract class CoursesStates {}

class CoursesInitialState extends CoursesStates {}

class GetCoursesLoadingState extends CoursesStates {}

class GetCoursesSuccessState extends CoursesStates {}

class GetCoursesErrorState extends CoursesStates {}


class FilterCoursesListWithInstructorNameInCoursesCubit extends CoursesStates{}

class CloseFilterCoursesListWithInstructorNameInCoursesCubit extends CoursesStates{}

class ChangeFromDateContainerValueStateInCoursesCubit extends CoursesStates{}

class ChangeToDateContainerValueStateInCoursesCubit extends CoursesStates{}

class FilterCoursesListWithDatesInCoursesCubit extends CoursesStates{}

class CloseFilterCoursesListWithDatesInCoursesCubit extends CoursesStates{}

class SchoolChangeInstructorNameInMenuStateInCoursesCubit extends CoursesStates{}
