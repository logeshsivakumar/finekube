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
      backgroundColor: ColorConstants.gradientEndColor,
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
                  child: Text('An error occured'),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    customAppbar(dataSnapshot.data!.data![3].img.toString()),
                  ],
                );
              }
            }
          },
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
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
              padding: const EdgeInsets.only(top:8.0),
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
          child:const ImageIcon(AssetImage('assets/images/notifications.png')),
        )
      ],
    );
  }

}
