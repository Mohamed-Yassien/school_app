abstract class PlansStates {}

class PlansInitialState extends PlansStates {}

class GetPlansLoadingState extends PlansStates {}

class GetPlansSuccessState extends PlansStates {}

class GetPlansErrorState extends PlansStates {}

class GetPlanByIdLoadingState extends PlansStates {}

class GetPlanByIdSuccessState extends PlansStates {}

class GetPlanByIdErrorState extends PlansStates {}
