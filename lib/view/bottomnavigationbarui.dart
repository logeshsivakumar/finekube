import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';


class BottomNavigationBarUI extends StatelessWidget {
  const BottomNavigationBarUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top:5.h),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(color: ColorConstants.tileHalfGrey),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedItemColor: ColorConstants.tileHalfGrey,
        unselectedItemColor: Colors.grey,
        items:  <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/home.png'),
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/history.png'),
            ),
            label: 'History',
          ),
          const  BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/articles.png')),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon:Padding(
              padding:  EdgeInsets.only(top:8.h),
              child: Container(
                decoration:  BoxDecoration(
                    color: ColorConstants.yellowColor,
                    borderRadius: BorderRadius.all(Radius.circular(24.sp)),
                    image:const DecorationImage(
                        image: AssetImage('assets/images/plus_2.png',),scale: 9.0
                    )
                ),
                height:50.h,
                width: 70.w,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
