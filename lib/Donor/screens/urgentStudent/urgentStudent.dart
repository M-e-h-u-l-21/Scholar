import "package:flutter/material.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/studentInfoBar.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/studentInfoCard.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/studentPOV.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/teacherremark.dart";
import "package:gscapp/Donor/screens/urgentStudent/widgets/urgentDonationCard.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class UrgentStudent extends StatelessWidget {
  UrgentStudent({Key? key, required this.stuname}) : super(key: key);
  String stuname;
  @override
  Widget build(BuildContext context) {
    final height = TDeviceUtils.getScreenHeight(context);
    final width = TDeviceUtils.getScreenWidth(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.scaffold,
        body: SingleChildScrollView(
          child: Column(
            children: [
              studentInfoTopBar(stuname: stuname),
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
              UrgentDonationCard(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Remarks from Teachers",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )),
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
              TextButton(
                onPressed: () {},
                child: Text("Donate Now"),
              )
            ],
          ),
        ),
      ),
    );
  }
}



