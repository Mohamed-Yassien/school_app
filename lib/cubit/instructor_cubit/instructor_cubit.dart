import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/instructor_cubit/instructor_states.dart';

import '../../models/instructors_model.dart';
import '../../network/endpoints.dart';
import '../../network/remote/dio_helper.dart';

class InstructorCubit extends Cubit<InstructorStates> {
  InstructorCubit() : super(InstructorInitialState());

  static InstructorCubit get(context) => BlocProvider.of(context);

  InstructorsModel? instructorsModel;

  List<String>? instructorsNames;

  void getInstructors() {
    emit(GetInstructorsLoadingState());
    DioHelper.getData(url: GET_INSTRUCTORS).then((value) {
      instructorsModel = InstructorsModel.fromJson(value.data);
      print(instructorsModel!.instructors![0].name);
      instructorsNames = List.generate(
        instructorsModel!.instructors!.length,
        (index) => instructorsModel!.instructors![index].name!,
      );
      print(instructorsNames);
      emit(GetInstructorsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetInstructorsErrorState());
    });
  }

}
