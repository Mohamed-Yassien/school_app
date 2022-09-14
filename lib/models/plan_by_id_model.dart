class PlanByIdModel {
  int? id;
  String? planName;
  String? price;
  String? discount;
  String? startDate;
  String? endDate;

  PlanByIdModel(
      {this.id,
        this.planName,
        this.price,
        this.discount,
        this.startDate,
        this.endDate});

  PlanByIdModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planName = json['plan_name'];
    price = json['price'];
    discount = json['discount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] =id;
    data['plan_name'] =planName;
    data['price'] =price;
    data['discount'] =discount;
    data['start_date'] =startDate;
    data['end_date'] =endDate;
    return data;
  }
}
