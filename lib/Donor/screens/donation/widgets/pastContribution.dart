import "package:flutter/material.dart";
import "package:gscapp/utils/constants/colors.dart";
import 'package:gscapp/Donor/screens/donation/widgets/paymentcard.dart';

class PastContribution extends StatelessWidget {
  const PastContribution({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: EdgeInsets.only(left: 8),
        //   child: Text(
        //     "Past Contribution",
        //     style: TextStyle(
        //         fontSize: 24,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: 'Niramit'),
        //   ),
        // ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.005,
        // ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "30 December , 2023",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0XFF969696)),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  child: VerticalDivider(color: Colors.grey[400])),
              CardContainer(c: ThemeColors.darkGreen),
              Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  child: VerticalDivider(color: Colors.grey[400])),
              CardContainer(c: ThemeColors.darkGreen),
              Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  child: VerticalDivider(color: Colors.grey[400])),
              Text(
                "28 December , 2023",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0XFF969696)),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  child: VerticalDivider(color: Colors.grey[400])),
              CardContainer(c: ThemeColors.darkGreen),
              Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  child: VerticalDivider(color: Colors.grey[400])),
              CardContainer(c: ThemeColors.darkGreen),
            ],
          ),
        )
      ],
    );
  }
}
