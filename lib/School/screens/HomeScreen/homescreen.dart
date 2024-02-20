import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import 'package:gscapp/Authentication/screens/landingPage.dart';
import 'package:gscapp/Authentication/screens/signinscreen.dart';
import "package:gscapp/School/screens/HomeScreen/widgets/studentprofilecard.dart";
import "package:gscapp/School/screens/NewStudent/newStudent.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = TDeviceUtils.getScreenHeight(context);
    final double width = TDeviceUtils.getScreenWidth(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.deepblue,
        leading: IconButton(
          icon: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => LandingPage(),
              ),
              (route) => false,
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewStudent(),
                    ));
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        title: Text(
          "Main Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: ThemeColors.scaffold,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //Top card
              Container(
                decoration: BoxDecoration(
                    color: Color(0X80e9dcc4),
                    borderRadius: BorderRadius.circular(8)),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Overview Text
                        Text(
                          "Overview",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          height: height * 0.015,
                        ),

                        //Column
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Application Submitted",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "390",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                              Container(
                                child: Divider(
                                  height: 10,
                                  thickness: 1.5,
                                  color: Color(0XFFC8C8C8),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Application Under Review",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "390",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                              Container(
                                child: Divider(
                                  height: 10,
                                  thickness: 1.5,
                                  color: Color(0XFFC8C8C8),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Applications Verified",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "390",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                              Container(
                                child: Divider(
                                  height: 10,
                                  thickness: 1.5,
                                  color: Color(0XFFC8C8C8),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Donors",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "390",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                              Container(
                                child: Divider(
                                  height: 10,
                                  thickness: 1.5,
                                  color: Color(0XFFC8C8C8),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ),

              SizedBox(
                height: height * 0.03,
              ),

              //Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Class - 6",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.sort_rounded),
                  ],
                ),
              ),

              //Tab View
              Expanded(
                child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: AppBar(
                        toolbarHeight: height * 0.02,
                        bottom: const TabBar(tabs: [
                          Tab(
                            text: "Verified Profiles",
                          ),
                          Tab(text: "Pending Profiles")
                        ]),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TabBarView(children: [
                          GridView.count(
                            primary: false,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            crossAxisSpacing: width * 0.08,
                            mainAxisSpacing: height * 0.04,
                            crossAxisCount: 2,
                            children: <Widget>[
                              StudentProfileCard(),
                              StudentProfileCard(),
                              StudentProfileCard(),
                              StudentProfileCard(),
                              StudentProfileCard(),
                              StudentProfileCard(),
                              StudentProfileCard(),
                            ],
                          ),
                          GridView.count(
                            primary: false,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            crossAxisSpacing: width * 0.08,
                            mainAxisSpacing: height * 0.04,
                            crossAxisCount: 2,
                            children: <Widget>[
                              StudentProfileCard(),
                              StudentProfileCard(),
                              StudentProfileCard(),
                              StudentProfileCard(),
                              StudentProfileCard(),
                              StudentProfileCard(),
                              StudentProfileCard(),
                            ],
                          ),
                        ]),
                      ),
                    )),
              ),

              // Grid View
            ],
          ),
        ),
      ),
    );
  }
}
