import 'package:finekube/model/homepagemodel.dart';
import 'package:finekube/viewmodel/homepageviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class UserListUI extends StatefulWidget {
  const UserListUI({Key? key}) : super(key: key);

  @override
  State<UserListUI> createState() => _UserListUIState();
}

class _UserListUIState extends State<UserListUI> {
  late Future<HomePageModel> dataFuture;
  HomePageViewModel homePageViewModel = HomePageViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataFuture = homePageViewModel.fetchHomePageData();
  }

  Future loadList() async {
    final data = homePageViewModel.fetchHomePageData();
    setState(() {
      dataFuture = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.sp, right: 8.sp),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight:Radius.circular(20.sp),topLeft:Radius.circular(20.sp) ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 55.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text("My debts",
                        style: GoogleFonts.lato(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Text("See All",
                        style: GoogleFonts.lato(
                          fontSize: 20.sp,
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
            ),
            FutureBuilder<HomePageModel>(
              future: dataFuture,
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: const CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (dataSnapshot.error != null) {
                    return Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: const Center(
                        child: Text('An error occurred'),
                      ),
                    );
                  } else {
                    return SizedBox(
                        height: 230.h, child: userList(dataSnapshot.data!));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget userList(HomePageModel dataSnapshot) {
    return RefreshIndicator(
      onRefresh: loadList,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                    margin: EdgeInsets.all(5.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 1.0,
                    child: SizedBox(
                        height: 50.h,
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                  dataSnapshot.data![index].img.toString()),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        dataSnapshot.data![index].name
                                            .toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 14.sp,
                                            color:
                                                ColorConstants.roundTileColor,
                                            fontWeight: FontWeight.w600)),
                                    Text(
                                        "Until ${dataSnapshot.data![index].until.toString()}",
                                        style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          //fontWeight: FontWeight.w600
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 100.w),
                                child: Column(
                                  children: [
                                    Text(
                                        dataSnapshot.data![index].amount
                                            .toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 14.sp,
                                            color:
                                                ColorConstants.tileColorOrange,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                        "Out of ${dataSnapshot.data![index].outOfAmount.toString()}",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp,
                                            color: Colors.grey)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )));
              },
              childCount: dataSnapshot.data!.length,
            ),
          ),
        ],
      ),
    );
  }
}
