import "package:flutter/material.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/volunteer/screens/donation/widgets/paymentcard.dart";

class UpcomingContribution extends StatelessWidget {
  const UpcomingContribution({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: EdgeInsets.only(left: 8),
        //   child: Text(
        //     "Upcoming Contribution",
        //     style: TextStyle(
        //         fontSize: 24,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: 'Niramit'),
        //   ),
        // ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.020,
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "5th January, 2024",
                style: TextStyle(
                    color: Color(0XFF969696), fontWeight: FontWeight.w600),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: VerticalDivider(color: Colors.grey[400])),
              CardContainer(
                c: ThemeColors.lightGreen,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  child: VerticalDivider(color: Colors.grey[400])),
              CardContainer(
                c: ThemeColors.lightGreen,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  child: VerticalDivider(color: Colors.grey[400])),
              CardContainer(
                c: ThemeColors.lightGreen,
              ),
            ],
          ),
        )
      ],
    );
  }
}
