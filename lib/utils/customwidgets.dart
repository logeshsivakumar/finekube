

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWidgets{
  static Widget customAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: CircleAvatar(
              radius: 17.sp, // Image radius
              backgroundImage:const NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600")
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text("Home",
              style: GoogleFonts.lato(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400
              )),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15.w),
          child:InkWell(
              onTap: (){},
              child: const ImageIcon(AssetImage('assets/images/notifications.png'))),
        )
      ],
    );
  }

}