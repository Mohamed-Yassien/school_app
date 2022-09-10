import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/login_cubit/login_states.dart';
import 'package:school_app/models/admin_model.dart';
import 'package:school_app/models/student_model.dart';
import 'package:school_app/network/endpoints.dart';
import 'package:school_app/network/local/cache_helper.dart';
import 'package:school_app/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  AdminModel? adminModel;

  adminLogin({
    required String email,
    required String password,
  }) {
    emit(AdminLoginLoadingState());
    DioHelper.postData(
      url: ADMIN_LOGIN,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      adminModel = AdminModel.fromJson(value.data);
      print(adminModel?.user?.email);
      emit(AdminLoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AdminLoginErrorState());
    });
  }

  bool isPassword = true;

  IconData iconData = Icons.visibility_off;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    iconData = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(LoginChangePasswordVisibilityState());
  }

  StudentModel? studentModel;

  studentLogin({
    required String nationalId,
    required String password,
  }) {
    emit(StudentLoginLoadingState());
    DioHelper.postData(
      url: STUDENT_LOGIN,
      data: {
        "student_national_id": nationalId,
        "password": password,
      },
    ).then((value) async {
      studentModel = StudentModel.fromJson(value.data);
      print(studentModel?.user?.studentNationalId);
      await CacheHelper.saveData(
          key: 'currentStudentId', value: studentModel?.user?.id);
      emit(StudentLoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(StudentLoginErrorState());
    });
  }
}
