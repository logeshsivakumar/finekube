import 'package:finekube/viewmodel/homepageviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(title: Text("home"),),
      body:  Consumer<HomePageViewModel>(builder: (context, provider, child) {
        return
          FutureBuilder<HomePageModel>(
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
                  return Text(dataSnapshot.data!.data![0].name.toString());
                }
              }
            },
          );
      }),
    );
  }
}
