import "package:flutter/material.dart";
import 'package:gscapp/volunteer/screens/donationtype/screens/widgets/fee_option_list.dart';

class Donationtype extends StatelessWidget {
  const Donationtype({Key? key}) : super(key: key);

  // final List cards=[]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Donation options Available -",
              style: TextStyle(
                  fontFamily: 'Niramit',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24,
            ),
            SingleChildScrollView(child: FeeOptionList())
          ],
        ),
      ),
    );
  }
}
