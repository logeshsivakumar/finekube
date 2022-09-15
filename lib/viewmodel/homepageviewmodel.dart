

import 'package:finekube/model/homepagemodel.dart';
import 'package:finekube/repository/homepagerepository.dart';
import 'package:flutter/cupertino.dart';

class HomePageViewModel extends ChangeNotifier{
HomePageRepository homePageRepository =HomePageRepository();

  Future<HomePageModel> fetchHomePageData() async{
    var response = await homePageRepository.homePageData();
    var obj=HomePageModel.fromJson(response);
    return obj;
  }
}