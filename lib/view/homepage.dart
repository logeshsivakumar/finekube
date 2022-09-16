import 'package:finekube/view/bottomnavigationbarui.dart';
import 'package:finekube/view/horizondallist.dart';
import 'package:finekube/view/userlistui.dart';
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
      body:Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              customAppbar(),
              SizedBox(
                height: 15.h,
              ),
              const Expanded(
                flex: 3,
                child:  HorizontalList(),
              ),
              const Expanded(
                  flex: 5,
                  child: UserListUI()
              )
            ],
          ),
          Positioned.fill(
              top: 250.h,
              left: 10.w,
              child: roundedButton()),
        ],
      ),
      bottomNavigationBar:const BottomNavigationBarUI(),
    );
  }
  Widget customAppbar() {
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

  Widget roundedButton(){
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
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    gradient:const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white60,Colors.white10]
                    ),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 2,color: Colors.white30)
                ),
                child: Center(
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: ColorConstants.roundTileColor,
                      borderRadius: BorderRadius.circular(30),
                      // border: Border.all(width: 2,color: Colors.black)
                    ),
                    child:  Center(
                      child:  Image.asset(icon[i],scale: 5,)
                    ),
                  ),
                ),
              ),
            ),
            Text(buttonName[i],style: GoogleFonts.lato(
            fontSize: 10.sp,
                color: Colors.black,
              fontWeight: FontWeight.w600
                ))
          ],
        ),
        ),
      ),
    );
  }
}
