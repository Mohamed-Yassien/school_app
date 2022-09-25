import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/subject_cubit/subject_states.dart';

import '../../models/subjects_model.dart';
import '../../network/endpoints.dart';
import '../../network/remote/dio_helper.dart';

class SubjectCubit extends Cubit<SubjectsStates>{
  SubjectCubit() : super(SubjectsInitialState());

  static SubjectCubit get(context) => BlocProvider.of(context);

  SubjectsModel? subjectsModel;

  void getSubjects() {
    emit(GetSubjectsLoadingState());
    DioHelper.getData(url: GET_SUBJECTS).then((value) {
      subjectsModel = SubjectsModel.fromJson(value.data);
      print(subjectsModel!.subjects![0].subject);
      emit(GetSubjectsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSubjectsErrorState());
    });
  }
}