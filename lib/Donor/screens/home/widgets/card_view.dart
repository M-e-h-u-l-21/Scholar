import "package:flutter/material.dart";
import 'package:gscapp/Donor/screens/donationtype/screens/donationtype.dart';
import 'package:gscapp/Donor/screens/studentProfile/studentprofile.dart';
import 'package:gscapp/Donor/screens/urgentStudent/urgentStudent.dart';
import 'package:gscapp/utils/constants/device_utility.dart';

class CardView extends StatelessWidget {
  CardView({super.key, required this.studentName});

  String studentName;

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.cyan,
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(studentName)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "•NTSE Scholar",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "•NSTSE qualified",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "•State level runner",
                            style: TextStyle(fontSize: 16),
                          ),
                          // Text(
                          //   "•Temp4",
                          //   style: TextStyle(fontSize: 16),
                          // ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Donationtype()));
                          },
                          child: Text("Support Now"))
                    ],
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
