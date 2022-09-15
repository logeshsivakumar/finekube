import 'package:finekube/view/bottomnavigationbarui.dart';
import 'package:finekube/view/horizondallist.dart';
import 'package:finekube/view/userlistui.dart';
import 'package:finekube/viewmodel/homepageviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../model/homepagemodel.dart';

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
      body: Consumer<HomePageViewModel>(builder: (context, provider, child) {
        return FutureBuilder<HomePageModel>(
          future: provider.fetchHomePageData(),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                return const Center(
                  child: Text('An error occurred'),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    customAppbar(dataSnapshot.data!.data![3].img.toString()),
                    SizedBox(
                      height: 15.h,
                    ),
                     const Expanded(
                      flex: 3,
                      child:  HorizontalList(),
                    ),
                    Expanded(
                      flex: 5,
                      child: UserListUI(homePageModel: dataSnapshot.data!,)
                    )
                  ],
                );
              }
            }
          },
        );
      }),
      bottomNavigationBar:const BottomNavigationBarUI(),
    );
  }
  Widget customAppbar(String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: CircleAvatar(
            radius: 17.sp, // Image radius
            backgroundImage: NetworkImage(image),
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
