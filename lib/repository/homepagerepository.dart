import 'package:finekube/service/apiservice.dart';

import '../constants/urlconstants.dart';

class HomePageRepository {
  final DioService _dioService = DioService();

  Future<dynamic> homePageData() async {
    var response = await _dioService.getHttp(UrlConstants.homePageURL);
    return response;
  }
}
