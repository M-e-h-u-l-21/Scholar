import "package:flutter/material.dart";
import 'package:gscapp/Donor/screens/donationPayment/widgets/costRow.dart';
import "package:gscapp/utils/constants/objects.dart";

class SemesterFeeDetail extends StatelessWidget {
  const SemesterFeeDetail({
    super.key,
    required this.title,
    required this.isA,
  });

  final String title;
  final bool isA;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        //semesterfee ki rendering
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            "₹${isA ? SchoolA.totalA.toString() : SchoolB.totalB.toString()}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      SizedBox(
          width: double.infinity,
          child: Divider(
            color: Colors.black,
            thickness: 1.5,
          )),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Container(
          child: Column(
            children: [
              CostRow(
                  text1: isA ? SchoolA.baseTuitionFee : SchoolB.baseTuitionFee,
                  text2: isA ? SchoolA.baseFee : SchoolB.baseFee),
              SizedBox(
                height: 8,
              ),
              CostRow(
                  text1:
                      isA ? SchoolA.baseComputerFee : SchoolB.baseComputerFee,
                  text2: isA ? SchoolA.computerFee : SchoolB.computerFee),
              SizedBox(
                height: 8,
              ),
              CostRow(
                  text1: isA ? SchoolA.baseMedicalFee : SchoolB.baseMedicalFee,
                  text2: isA ? SchoolA.medicalFee : SchoolB.medicalFee),
              SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Cost",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "₹${isA ? SchoolA.totalA.toString() : SchoolB.totalB.toString()}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
