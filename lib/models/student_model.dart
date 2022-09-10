class StudentModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;

  StudentModel({this.accessToken, this.tokenType, this.expiresIn, this.user});

  StudentModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? age;
  String? date;
  String? classroom;
  String? guardianName;
  String? guardianJob;
  String? firstPhone;
  String? secondPhone;
  String? studentNationalId;
  String? city;
  String? sittingNumber;
  String? notes;
  String? status;
  String? password;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.age,
      this.date,
      this.classroom,
      this.guardianName,
      this.guardianJob,
      this.firstPhone,
      this.secondPhone,
      this.studentNationalId,
      this.city,
      this.sittingNumber,
      this.notes,
      this.status,
      this.password,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    date = json['date'];
    classroom = json['classroom'];
    guardianName = json['guardian_name'];
    guardianJob = json['guardian_job'];
    firstPhone = json['first_phone'];
    secondPhone = json['second_phone'];
    studentNationalId = json['student_national_id'];
    city = json['city'];
    sittingNumber = json['sitting_number'];
    notes = json['notes'];
    status = json['status'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['date'] = date;
    data['classroom'] = classroom;
    data['guardian_name'] = guardianName;
    data['guardian_job'] = guardianJob;
    data['first_phone'] = firstPhone;
    data['second_phone'] = secondPhone;
    data['student_national_id'] = studentNationalId;
    data['city'] = city;
    data['sitting_number'] = sittingNumber;
    data['notes'] = notes;
    data['status'] = status;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
