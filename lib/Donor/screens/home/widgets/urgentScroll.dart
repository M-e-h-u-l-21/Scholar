import "package:flutter/material.dart";
import 'package:gscapp/Donor/screens/home/widgets/card_view.dart';

class UrgentScroll extends StatelessWidget {
  UrgentScroll({super.key, required this.studentData});

  Map<String, dynamic> studentData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: studentData.keys.map((studentId) {
          Map<String, dynamic> studentInfo = studentData[studentId]!;
          return CardView(
            studentName: studentInfo['studentname'],
          );
        }).toList(),
        // ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: studentData.length,
        //   itemBuilder: (context, index) {
        //     String studentid = studentData.keys.elementAt(index);
        //     Map<String, dynamic> studentInfo = studentData[studentid];
        //     return CardView(
        //       studentName: studentInfo['studentname'],
        //     );
        //   },
        // ),

        // CardView(),
        // SizedBox(
        //   width: 4,
        // ),
        // CardView(),
        // SizedBox(
        //   width: 4,
        // ),
        // CardView(),
      ),
    );
  }
}
