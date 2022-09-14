class PlansModel {
  List<Plans>? plans;

  PlansModel({this.plans});

  PlansModel.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  int? id;
  String? planName;
  String? price;
  String? discount;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;

  Plans(
      {this.id,
      this.planName,
      this.price,
      this.discount,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt});

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planName = json['plan_name'];
    price = json['price'];
    discount = json['discount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plan_name'] = planName;
    data['price'] = price;
    data['discount'] = discount;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
