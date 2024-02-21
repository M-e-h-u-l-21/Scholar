import "package:flutter/material.dart";
import 'package:gscapp/utils/constants/colors.dart';
import 'package:gscapp/Donor/screens/donationtype/screens/widgets/fee_option_list.dart';

class Donationtype extends StatelessWidget {
  const Donationtype({Key? key}) : super(key: key);

  // final List cards=[]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                "Donation options Available -",
                style: TextStyle(
                    fontFamily: 'Niramit',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(child: FeeOptionList()),
          ],
        ),
      ),
    );
  }
}
