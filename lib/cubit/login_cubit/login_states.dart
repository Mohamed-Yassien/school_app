abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class AdminLoginLoadingState extends LoginStates {}

class AdminLoginSuccessState extends LoginStates {}

class AdminLoginErrorState extends LoginStates {}

class LoginChangePasswordVisibilityState extends LoginStates {}

class StudentLoginLoadingState extends LoginStates {}

class StudentLoginSuccessState extends LoginStates {}

class StudentLoginErrorState extends LoginStates {}
