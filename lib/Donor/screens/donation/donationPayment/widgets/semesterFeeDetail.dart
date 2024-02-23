import "package:flutter/material.dart";
import "package:gscapp/Donor/screens/donation/donationPayment/widgets/costRow.dart";
import "package:gscapp/utils/constants/objects.dart";

class SemesterFeeDetail extends StatelessWidget {
  const SemesterFeeDetail({
    super.key,
    required this.title,
  });

  final String title;

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
            "₹${SchoolA.totalA.toString()}",
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
              CostRow(text1: SchoolA.baseTuitionFee, text2: SchoolA.baseFee),
              SizedBox(
                height: 8,
              ),
              CostRow(
                  text1: SchoolA.baseComputerFee, text2: SchoolA.computerFee),
              SizedBox(
                height: 8,
              ),
              CostRow(text1: SchoolA.baseMedicalFee, text2: SchoolA.medicalFee),
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
                        "₹${SchoolA.totalA.toString()}",
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
