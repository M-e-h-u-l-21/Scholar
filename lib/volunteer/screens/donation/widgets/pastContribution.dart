import "package:flutter/material.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/volunteer/screens/donation/widgets/paymentcard.dart";

class PastContribution extends StatelessWidget {
  const PastContribution({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            "Past Contribution",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Niramit'),
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Text("30 December , 2023"),
              Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  child: VerticalDivider(color: Colors.grey[600])),
              CardContainer(c: ThemeColors.darkGreen),
              Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  child: VerticalDivider(color: Colors.grey[600])),
              CardContainer(c: ThemeColors.darkGreen),
              Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  child: VerticalDivider(color: Colors.grey[600])),
              Text("28 December , 2023"),
              Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  child: VerticalDivider(color: Colors.grey[600])),
              CardContainer(c: ThemeColors.darkGreen),
              Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                  child: VerticalDivider(color: Colors.grey[600])),
              CardContainer(c: ThemeColors.darkGreen),
            ],
          ),
        )
      ],
    );
  }
}
