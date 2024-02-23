import "package:flutter/material.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class Requirementrow extends StatelessWidget {
  const Requirementrow(
      {Key? key,
      required this.title,
      required this.amount,
      required this.description})
      : super(key: key);
  final String title;
  final String amount;
  final String description;

  @override
  Widget build(BuildContext context) {
    final width = TDeviceUtils.getScreenWidth(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            size: 10,
          ),
          SizedBox(
            width: width * 0.03,
          ),
          SizedBox(width: width * 0.3, child: Text(title)),
          SizedBox(
            width: width * 0.03,
          ),
          Text("-"),
          SizedBox(
            width: width * 0.03,
          ),
          SizedBox(width: width * 0.13, child: Text(amount)),
          SizedBox(
            width: width * 0.03,
          ),
          Expanded(child: Text("($description)")),
        ],
      ),
    );
  }
}
