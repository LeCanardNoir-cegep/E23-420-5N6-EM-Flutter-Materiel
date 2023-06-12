import 'package:dio/dio.dart';

import 'my_day.dart';

class HttpService{
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://4n6.azurewebsites.net/exam"
  ));

  Future<List<MyDay>> getMyDay(String year, String month, String day) async {
    var res = await _dio.get("/$year/$month/$day");
    print(res.data);
    var jsonList = res.data as List;
    return jsonList.map((e) => MyDay.fromJson(e)).toList();
  }
}