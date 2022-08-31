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
  String? subject;
  String? description;
  String? instructor;
  String? numberOfLectures;
  List<String>? dates;

  Courses(
      {this.id,
      this.subject,
      this.description,
      this.instructor,
      this.numberOfLectures,
      this.dates});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    description = json['description'];
    instructor = json['instructor'];
    numberOfLectures = json['number_of_lectures'];
    dates = json['dates'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subject'] = subject;
    data['description'] = description;
    data['instructor'] = instructor;
    data['number_of_lectures'] = numberOfLectures;
    data['dates'] = dates;
    return data;
  }
}
