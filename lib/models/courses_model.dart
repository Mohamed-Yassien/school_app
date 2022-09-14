class CoursesModel {
  List<Courses>? courses;

  CoursesModel({this.courses});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? id;
  int? instructorId;
  String? subject;
  String? firstSectionDate;
  String? description;
  String? instructor;
  String? numberOfLectures;
  List<String>? dates;
  String? price;
  String? discount;

  Courses({
    this.id,
    this.subject,
    this.firstSectionDate,
    this.description,
    this.instructor,
    this.numberOfLectures,
    this.dates,
    this.instructorId,
    this.price,
    this.discount,
  });

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructorId = json['instructor_id'];
    subject = json['subject'];
    firstSectionDate = json['first_session_date'];
    description = json['description'];
    instructor = json['instructor'];
    numberOfLectures = json['number_of_lectures'];
    dates = json['dates'].cast<String>();
    price = json['price'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['instructor_id'] = instructorId;
    data['subject'] = subject;
    data['first_session_date'] = firstSectionDate;
    data['description'] = description;
    data['instructor'] = instructor;
    data['number_of_lectures'] = numberOfLectures;
    data['dates'] = dates;
    data['price'] = price;
    data['discount'] = discount;
    return data;
  }
}
