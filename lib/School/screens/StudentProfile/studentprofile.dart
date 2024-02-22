import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/studentInfoBar.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/studentInfoCard.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/studentPOV.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/teacherremark.dart";
import "package:gscapp/provider/student_dataprovider.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class Studentprofile extends ConsumerWidget {
  const Studentprofile({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = TDeviceUtils.getScreenHeight(context);
    final width = TDeviceUtils.getScreenWidth(context);
    final data = ref.read(studentProvider);
    final studentinfo = {name: data[name]};
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.scaffold,
        body: SingleChildScrollView(
          child: Column(
            children: [
              studentInfoTopBar(stuname: name),
              SizedBox(
                height: height * 0.010,
              ),
              Text(
                "Support his Education",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Niramit'),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.038, right: width * 0.038),
                child: StudentInfoRow(),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: width * 0.03),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Requirements",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      IconButton(
                          onPressed: () {
                           
                          },
                          icon: Icon(
                            Icons.edit,
                          ))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                          ),
                          Text("Semester Fee"),
                          Text("-"),
                          Text("4000"),
                          Text("(for October Month)")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                          ),
                          Text("Semester Fee"),
                          Text("-"),
                          Text("4000"),
                          Text("(for October Month)")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                          ),
                          Text("Semester Fee"),
                          Text("-"),
                          Text("4000"),
                          Text("(for October Month)")
                        ],
                      )
                    ],
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: width * 0.01),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Remarks from Teachers",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                            )),
                      )
                    ]),
              ),
              TeacherRemark(height: height, width: width),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ),
              StudentPov(width: width, height: height),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
