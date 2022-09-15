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
    List<String> icon = ["top_right_arrow.png","bottom_left_arrow.png","top_right_arrow.png","bottom_left_arrow.png",];
    return ListView(
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top:40.h,left: 10.w),
                        child: Text(header[i], style: GoogleFonts.lato(
                          fontSize: 20.sp,
                          color: Colors.white,
                        )),
                      ),
                      //  Expanded(child: Image.asset("notifications.png"))
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:15.h,left: 10.w),
                    child: Text(price[i], style: GoogleFonts.lato(
                      fontSize: 30.sp,
                      color: Colors.white,
                    )),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:15.h,left: 10.w),
                    child: Text("2 debts", style: GoogleFonts.lato(
                      fontSize: 20.sp,
                      color: Colors.white,
                    )),
                  )
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
