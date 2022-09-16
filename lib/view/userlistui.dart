import 'package:finekube/model/homepagemodel.dart';
import 'package:finekube/viewmodel/homepageviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

class UserListUI extends StatefulWidget {

  const UserListUI({Key? key,}) : super(key: key);

  @override
  State<UserListUI> createState() => _UserListUIState();
}

class _UserListUIState extends State<UserListUI> {


  Future refresh() async{

  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 8.sp,right: 8.sp),
      child: Align(
        child: Container(
          width:  double.infinity,
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top:60.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left:15.w),
                      child: Text("My debts",style: GoogleFonts.lato(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right:15.w),
                      child: Text("See All",style: GoogleFonts.lato(
                        fontSize: 20.sp,
                        color: Colors.grey,
                      )),
                    ),
                  ],
                ),
              ),
              Consumer<HomePageViewModel>(builder: (context, provider, child) {
                return FutureBuilder<HomePageModel>(
                  future: provider.fetchHomePageData(),
                  builder: (context, dataSnapshot) {
                    if (dataSnapshot.connectionState == ConnectionState.waiting) {
                      return  Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child:const CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      if (dataSnapshot.error != null) {
                        return  Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child:const Center(
                            child: Text('An error occurred'),
                          ),
                        );
                      } else {
                        return  Expanded(
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:15.w),
                            child: RefreshIndicator(
                              onRefresh: refresh,
                              child: ListView.builder(
                                  itemCount: dataSnapshot.data!.data!.length,
                                  itemBuilder:(context,index){
                                    return Card(
                                        margin: EdgeInsets.all(5.sp),
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        elevation: 1.0,
                                        child: SizedBox(
                                            height: 50.h,
                                            child: Padding(
                                              padding:  EdgeInsets.all(10.sp),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Image.network(dataSnapshot.data!.data![index].img.toString()),
                                                  Padding(
                                                    padding:  EdgeInsets.only(left:5.w),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(dataSnapshot.data!.data![index].name.toString(),style: GoogleFonts.lato(
                                                            fontSize: 14.sp,
                                                            color:ColorConstants.roundTileColor,
                                                            fontWeight: FontWeight.w600
                                                        )),
                                                        Text("Until 20/03/22",style: GoogleFonts.lato(
                                                          fontSize: 12.sp,
                                                          color:Colors.grey,
                                                          //fontWeight: FontWeight.w600
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(left:120.w),
                                                    child: Column(
                                                      children: [
                                                        Text(dataSnapshot.data!.data![index].amount.toString(),style: GoogleFonts.lato(
                                                            fontSize: 14.sp,
                                                            color:ColorConstants.tileColorOrange,
                                                            fontWeight: FontWeight.w600
                                                        )),
                                                        SizedBox(
                                                          height: 1.h,
                                                        ),
                                                        Text("Out of \$ 1000",style: GoogleFonts.lato(
                                                            fontSize: 12.sp,
                                                            color:Colors.grey
                                                        )),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )));
                                  } ),
                            ),
                          ),
                        );
                      }
                    }
                  },
                );
              }),






















            ],
          ),
        ),
      ),
    );
  }
}

