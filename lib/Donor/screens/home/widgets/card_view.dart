import "package:flutter/material.dart";
import 'package:gscapp/Donor/screens/donationtype/screens/donationtype.dart';
import 'package:gscapp/Donor/screens/home/makeDonation.dart';
import 'package:gscapp/Donor/screens/studentProfile/studentprofile.dart';
import 'package:gscapp/Donor/screens/urgentStudent/urgentStudent.dart';
import 'package:gscapp/utils/constants/device_utility.dart';

class CardView extends StatelessWidget {
  CardView(
      {super.key,
      required this.studentName,
      required this.grade,
      required this.school});

  String studentName;
  int grade;
  String school;

  @override
  Widget build(BuildContext context) {
    final height = TDeviceUtils.getScreenHeight(context);
    final width = TDeviceUtils.getScreenWidth(context);
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Studentprofile(
                    name: studentName,
                  ))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: height * 0.25,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 233, 219),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Container(
            padding: EdgeInsets.only(top: 16, bottom: 16, right: 4),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage('assets/images/man.png'),
                        height: 110,
                        width: 110,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        studentName,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "• Class - ${grade}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "• ${school}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Donation Goal - 18000",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              width: width * 0.35,
                              child: LinearProgressIndicator(
                                value: 0.75,
                                minHeight: 6,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "75% Target reached",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            // Text(
                            //   "•Temp4",
                            //   style: TextStyle(fontSize: 16),
                            // ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MakeDonation()));
                            },
                            child: Text("Support Now"))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
