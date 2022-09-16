import 'package:finekube/model/homepagemodel.dart';
import 'package:finekube/utils/customwidgets.dart';
import 'package:finekube/view/bottomnavigationbarui.dart';
import 'package:finekube/view/horizondallist.dart';
import 'package:finekube/view/roundedbutton.dart';
import 'package:finekube/view/userlistui.dart';
import 'package:finekube/viewmodel/homepageviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBgColor,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              CustomWidgets.customAppbar(),
              SizedBox(
                height: 15.h,
              ),
              const Flexible(
                flex: 3,
                child: HorizontalList(),
              ),
              const Flexible(
                flex: 5,
                child:UserListUI()
              )
            ],
          ),
          Positioned.fill(top: 250.h, left: 10.w, child: const RoundedButton()),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarUI(),
    );
  }
}
