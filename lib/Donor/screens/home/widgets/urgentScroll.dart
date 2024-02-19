import "package:flutter/material.dart";
import 'package:gscapp/Donor/screens/home/widgets/card_view.dart';

class UrgentScroll extends StatelessWidget {
  const UrgentScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardView(),
          SizedBox(
            width: 4,
          ),
          CardView(),
          SizedBox(
            width: 4,
          ),
          CardView(),
        ],
      ),
    );
  }
}
