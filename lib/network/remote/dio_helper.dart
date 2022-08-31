import 'dart:io';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://school.innovativeideasbox.com/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    bool haveFile = false,
    String? token,
  }) async {
    dio.options.headers = haveFile == true
        ? {
            'Content-Type': 'application/json',
            'Authorization': token,
          }
        : {
            'Content-Type': 'application/json',
            'Authorization': token,
          };
    print('go to form data hereeee');
    FormData formData = FormData.fromMap(body);
    print('escape form data');
    body.forEach(
      (key, value) async {
        print('inside body in formmmmmmmmmmmmmm');
        print('value is $value');
        print('key is $key');
        if (value is List<Map>) {
          List<MapEntry<String, MultipartFile>> files = [];
          print('inside map value ');
          value.forEach(
            (element) {
              element.forEach(
                (elementKey, elementValue) {
                  print('element key is $elementKey');
                  print('element value is $elementValue');
                  if (elementValue is File) {
                    print('here is a file in map: $elementValue');
                    haveFile = true;
                    MapEntry<String, MultipartFile> pic = MapEntry(
                      "$elementKey",
                      MultipartFile.fromFileSync(
                        elementValue.path,
                        filename: elementValue.path.split("/").last,
                      ),
                    );
                    files.add(pic);
                    print('added file to files');
                  }
                },
              );
            },
          );
          formData.files.addAll(files);
          print('all files added to from data');
        } else if ((value) is File) {
          print('here is a fileeeeeeeeeeeeeeeee as single');
          print('the file is $value');
          haveFile = true;
          MapEntry<String, MultipartFile> pic = MapEntry(
            "$key",
            MultipartFile.fromFileSync(
              value.path,
              filename: value.path.split("/").last,
            ),
          );
          formData.files.add(pic);
        } else if ((value) is List<File>) {
          haveFile = true;
          List<MapEntry<String, MultipartFile>> files = [];
          value.forEach(
            (element) async {
              MapEntry<String, MultipartFile> pic = MapEntry(
                  "$key",
                  MultipartFile.fromFileSync(
                    element.path,
                    filename: element.path.split("/").last,
                  ));
              files.add(pic);
            },
          );
          formData.files.addAll(files);
        }
      },
    );
    formData.files.forEach((element) {
      print('file in form data is ${element}');
      print('run time type is ${element.value.runtimeType}');
    });
    print('form files length is : ${formData.files.length}');
    print('form data files runtime type is ${formData.files.runtimeType}');
    print('form data  runtime type is ${formData.runtimeType}');
    print('form data is ${formData.fields}');
    return await dio.post(
      "$url",
      data: haveFile ? formData : body,
    );
  }
}
