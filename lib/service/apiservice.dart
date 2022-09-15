
import 'package:dio/dio.dart';
import 'package:finekube/constants/constants.dart';

class DioService {

  Future<dynamic> getHttp(String baseUrl) async {
    Response? response;
    try {
      if(baseUrl.isNotEmpty) {
        response = await Dio().get(baseUrl);
      }
    } catch (e) {
      print(e);
    }
    return response?.data;
  }
}