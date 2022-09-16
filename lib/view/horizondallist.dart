import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [ColorConstants.roundTileColor,ColorConstants.tileColorGreen,ColorConstants.tileColorOrange,ColorConstants.tileHalfBlue];
    List<String> header = ["I owe","Owe me","I owe","Owe me"];
    List<String> price = ["\$ 1852","\$ 1250","\$ 1130","\$ 1752"];
    List<String> icon = ["assets/images/top_right_arrow.png","assets/images/bottom_left_arrow.png","assets/images/top_right_arrow.png","assets/images/bottom_left_arrow.png",];
    return Padding(
      padding:  EdgeInsets.only(left:10.sp,),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          4, (i) => Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Align(
            child: Container(
              decoration:  BoxDecoration(
                color: colors[i],
                borderRadius: BorderRadius.all(Radius.circular(24.sp)),
              ),
              height:180.h,
              width:150.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:EdgeInsets.only(top:50.h),
                    child: Column(
                      children: [
                        Padding(
                          padding:EdgeInsets.only(right: 15.w),
                          child: Text(header[i], style: GoogleFonts.lato(
                            fontSize: 16.sp,
                            color: Colors.white,
                          )),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:10.h,left: 10.w),
                          child: Text(price[i], style: GoogleFonts.lato(
                            fontSize: 26.sp,
                            color: Colors.white,
                          )),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:5.h,right: 15.w),
                          child: Text("2 debts", style: GoogleFonts.lato(
                            fontSize: 16.sp,
                            color: Colors.white,
                          )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Padding(
                    padding:  EdgeInsets.only(top: 20.w,right: 10.w),
                    child: Image.asset(icon[i],scale: 3,),
                  ))
                ],
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }
}
