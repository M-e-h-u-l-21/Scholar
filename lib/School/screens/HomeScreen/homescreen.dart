import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:gscapp/Authentication/screens/landingPage.dart';
import 'package:gscapp/Authentication/screens/signinscreen.dart';
import "package:gscapp/School/model/student.dart";
import 'package:gscapp/School/screens/HomeScreen/services/fetchData.dart';
import "package:gscapp/School/screens/HomeScreen/widgets/stats_container.dart";
import "package:gscapp/School/screens/HomeScreen/widgets/studentprofilecard.dart";
import "package:gscapp/School/screens/NewStudent/newStudent.dart";
import "package:gscapp/School/screens/NewStudent/services/firebase_services.dart";
import "package:gscapp/School/screens/StudentProfile/studentprofile.dart";
import "package:gscapp/provider/school_studentdataprovider.dart";
import "package:gscapp/provider/schooldataprovider.dart";
import "package:gscapp/provider/student_dataprovider.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(schoolDataProvider.notifier).fetchStudentData();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(studentProvider.notifier).fetchData();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(schoolData.notifier).getSchoolData();
    });
  }

  // void updateStudentData(Student student) async {
  //   await _firebaseService.createStudent(
  //       student.name,
  //       student.standard,
  //       student.fathersName,
  //       student.fathersOccupation,
  //       student.mothersOccupation,
  //       student.annualIncome,
  //       student.numFamMembers,
  //       student.schoolName,
  //       student.scholarNo,
  //       student.address,
  //       student.stuContactNo,
  //       student.guardContactNo,
  //       context);

  //   // Map<String, dynamic> data = await _fetchData.fetchStudentData();

  //   setState(() {
  //     // studentData = data; //Ye change krna padega
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final studentData = ref.watch(schoolDataProvider);
    print(studentData);
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
                      builder: (context) => NewStudent(),
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
              StatsContainer(height: height),

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
                      child: TabBarView(
                        children: [
                          GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8),
                              itemCount: studentData.length,
                              itemBuilder: (context, index) {
                                String studentId =
                                    studentData.keys.elementAt(index);
                                Map<String, dynamic> studentInfo =
                                    studentData[studentId];
                                return InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => Studentprofile(
                                          name: studentInfo['studentname'],
                                        ),
                                      ));
                                    },
                                    child: StudentProfileCard(
                                        name: studentInfo['studentname'],
                                        verifiedBy: "",
                                        verifiedOn: ""));
                              }),
                          GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8),
                              itemCount: studentData.length,
                              itemBuilder: (context, index) {
                                String studentId =
                                    studentData.keys.elementAt(index);
                                Map<String, dynamic> studentInfo =
                                    studentData[studentId];
                                return StudentProfileCard(
                                    name: studentInfo['studentname'],
                                    verifiedBy: "",
                                    verifiedOn: "");
                              })
                          // Other TabBarView children...
                        ],
                      ),
                    ),
                  ),
                ),
              ) // Grid View
            ],
          ),
        ),
      ),
    );
  }
}
