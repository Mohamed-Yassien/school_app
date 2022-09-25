abstract class StudentStates {}

class StudentInitialState extends StudentStates {}

class GetStudentsLoadingState extends StudentStates {}

class GetStudentsSuccessState extends StudentStates {}

class GetStudentsErrorState extends StudentStates {}

class ClearAllStudentDataState extends StudentStates {}

class ChangeStudentStatusNameInListState extends StudentStates {}

class AddNewStudentLoadingState extends StudentStates {}

class AddNewStudentSuccessState extends StudentStates {}

class AddNewStudentErrorState extends StudentStates {}

class ChangeStudentBottomNavState extends StudentStates{}
