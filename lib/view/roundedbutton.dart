import 'package:finekube/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> buttonName =['NEW','PAY OFF','LEND','MORE'];
    List<String> icon =['assets/images/plus.png','assets/images/topright-arrow.png','assets/images/bottomleft_arrow.png','assets/images/grid.png'];
    return  Padding(
      padding:  EdgeInsets.only(left:10.sp,),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          4, (i) =>  Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.sp),
              child: Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                    gradient:const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white60,Colors.white10]
                    ),
                    borderRadius: BorderRadius.circular(25.sp),
                    border: Border.all(width: 2,color: Colors.white30)
                ),
                child: Center(
                  child: Container(
                    height: 58.h,
                    width: 58.w,
                    decoration: BoxDecoration(
                      color: ColorConstants.roundTileColor,
                      borderRadius: BorderRadius.circular(50.sp),
                      // border: Border.all(width: 2,color: Colors.black)
                    ),
                    child:  Center(
                        child:  Image.asset(icon[i],scale: 5,)
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Text(buttonName[i],style: GoogleFonts.lato(
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              )),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
