import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/plans_cubit/plans_states.dart';

import '../../models/plan_by_id_model.dart';
import '../../models/plans_model.dart';
import '../../network/endpoints.dart';
import '../../network/remote/dio_helper.dart';

class PlansCubit extends Cubit<PlansStates> {
  PlansCubit() : super(PlansInitialState());

  static PlansCubit get(context) => BlocProvider.of(context);

  PlansModel? plansModel;

  getPlans() async {
    emit(GetPlansLoadingState());
    DioHelper.getData(url: GET_PLANS).then((value) {
      plansModel = PlansModel.fromJson(value.data);
      print(plansModel?.plans?[0].startDate);
      emit(GetPlansSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPlansErrorState());
    });
  }

  PlanByIdModel? planByIdModel;

  getPlanById(int id) async {
    emit(GetPlanByIdLoadingState());
    DioHelper.getData(url: '$GET_PLAN_BY_ID$id').then((value) {
      planByIdModel = PlanByIdModel.fromJson(value.data);
      print(planByIdModel?.planName);
      emit(GetPlanByIdSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPlanByIdErrorState());
    });
  }
}
