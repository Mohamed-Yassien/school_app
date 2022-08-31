class InstructorsModel {
  List<Instructors>? instructors;

  InstructorsModel({this.instructors});

  InstructorsModel.fromJson(Map<String, dynamic> json) {
    if (json['instructors'] != null) {
      instructors = <Instructors>[];
      json['instructors'].forEach((v) {
        instructors!.add( Instructors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (instructors != null) {
      data['instructors'] = instructors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Instructors {
  int? id;
  String? name;
  String? hiringDate;
  String? nationalId;
  String? firstPhone;
  String? secondPhone;
  String? contractType;
  String? salaryType;
  String? salary;
  String? createdAt;
  String? updatedAt;

  Instructors(
      {this.id,
        this.name,
        this.hiringDate,
        this.nationalId,
        this.firstPhone,
        this.secondPhone,
        this.contractType,
        this.salaryType,
        this.salary,
        this.createdAt,
        this.updatedAt});

  Instructors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hiringDate = json['hiring_date'];
    nationalId = json['nationalId'];
    firstPhone = json['first_phone'];
    secondPhone = json['second_phone'];
    contractType = json['contract_type'];
    salaryType = json['salary_type'];
    salary = json['salary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] =id;
    data['name'] =name;
    data['hiring_date'] =hiringDate;
    data['nationalId'] =nationalId;
    data['first_phone'] =firstPhone;
    data['second_phone'] =secondPhone;
    data['contract_type'] =contractType;
    data['salary_type'] =salaryType;
    data['salary'] =salary;
    data['created_at'] =createdAt;
    data['updated_at'] =updatedAt;
    return data;
  }
}
