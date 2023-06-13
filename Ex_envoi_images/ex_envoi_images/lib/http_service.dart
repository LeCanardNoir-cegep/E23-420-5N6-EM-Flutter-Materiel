import 'dart:io';

import 'package:dio/dio.dart';

class HttpService{
  final Dio dio = Dio(BaseOptions(
    baseUrl: "http://10.0.2.2:8080"
  ));

  Future<List<int>> postManyImage( List<File> filesList ) async{
    List<int> idList = [];

    for( File file in filesList ){
      FormData fData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(file.path)}
      );
      Response res = await dio.post("/file?taskID=2", data: fData);
      idList.add(int.parse(res.data as String));
    }

    return idList;
  }
}