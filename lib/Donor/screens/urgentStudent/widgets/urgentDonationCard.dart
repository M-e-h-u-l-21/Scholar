import "package:flutter/material.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class UrgentDonationCard extends StatelessWidget {
  const UrgentDonationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = TDeviceUtils.getScreenWidth(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 12),
      child: Container(
          decoration: BoxDecoration(
              color: Color(0XFFFFECD0), borderRadius: BorderRadius.circular(8)),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              //Donation goal
              Row(
                children: [
                  Text(
                    "Donation Goal",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),

              //Progress bar + days left
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.75,
                      minHeight: 6,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.08,
                  ),
                  Text(
                    "6/10 days",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),

              //Target + Raised
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Target : ₹12000",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Raised : ₹8000",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ]),
          )),
    );
  }
}
