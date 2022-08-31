class Student {
  String? name;
  String? age;
  DateTime? date;
  String? classroom;
  String? guardian_name;
  String? guardian_job;
  String? first_phone;
  String? second_phone;
  String? student_national_id;
  String? city;
  String? sitting_number;
  String? notes;
  String? status;

  Student(
      {this.name,
        this.age,
        this.date,
        this.classroom,
        this.guardian_name,
        this.guardian_job,
        this.first_phone,
        this.second_phone,
        this.student_national_id,
        this.city,
        this.sitting_number,
        this.notes,
        this.status});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    date = json['date'];
    classroom = json['classroom'];
    guardian_name = json['guardian_name'];
    guardian_job = json['guardian_job'];
    first_phone = json['first_phone'];
    second_phone = json['second_phone'];
    student_national_id = json['student_national_id'];
    city = json['city'];
    sitting_number = json['sitting_number'];
    notes = json['notes'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['date'] = date;
    data['classroom'] = classroom;
    data['guardian_name'] = guardian_name;
    data['guardian_job'] = guardian_job;
    data['first_phone'] = first_phone;
    data['second_phone'] = second_phone;
    data['student_national_id'] = student_national_id;
    data['city'] = city;
    data['sitting_number'] = sitting_number;
    data['notes'] = notes;
    data['status'] = status;
    return data;
  }
}
