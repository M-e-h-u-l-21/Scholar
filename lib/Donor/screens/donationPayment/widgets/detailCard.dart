import "package:flutter/material.dart";
import 'package:gscapp/Donor/screens/donationPayment/widgets/semesterFeeDetail.dart';
import 'package:gscapp/Donor/screens/donationPayment/widgets/uniformdetail.dart';

class DetailCard extends StatelessWidget {
  DetailCard({super.key, required this.title});

  final String title;

  RegExp uniformRegex = RegExp(r'uniform', caseSensitive: false);
  RegExp semesterFeeRegexA =
      RegExp(r'schoola semester fee', caseSensitive: false);
  RegExp semesterFeeRegexB =
      RegExp(r'schoolb semester fee', caseSensitive: false);
  RegExp stationaryRegex = RegExp(r'stationary', caseSensitive: false);

  @override
  Widget build(BuildContext context) {
    bool uniform = uniformRegex.hasMatch(title);
    bool semesterFeeA = semesterFeeRegexA.hasMatch(title);
    bool semesterFeeB = semesterFeeRegexB.hasMatch(title);
    bool stationary = stationaryRegex.hasMatch(title);

    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Container(
          child: uniform
              ? UniformDetail(title: title)
              : (semesterFeeA
                  ? SemesterFeeDetail(
                      title: title,
                      isA: semesterFeeA,
                    )
                  : semesterFeeB
                      ? SemesterFeeDetail(
                          title: title,
                          isA: semesterFeeA,
                        )
                      : Column(
                          children: [
                            //Stationary ki rendering
                            Row()
                          ],
                        ))),
    );
  }
}
