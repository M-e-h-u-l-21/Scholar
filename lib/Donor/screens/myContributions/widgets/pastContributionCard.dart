import "package:flutter/material.dart";
import "package:gscapp/Donor/screens/myContributions/widgets/paymentcard.dart";
import "package:gscapp/utils/constants/colors.dart";
import 'package:intl/intl.dart';

class PastContributionCard extends StatelessWidget {
  const PastContributionCard({
    super.key,
    required this.date,
    required this.name,
    required this.amount,
    required this.previous,
  });

  final DateTime date;
  final String name;
  final int amount;
  final bool previous;

  String formatDate(String inputDateTimeString) {
    DateTime dateTime = DateTime.parse(inputDateTimeString);

    String formattedDate = DateFormat('dd MMMM, yyyy').format(dateTime);

    return formattedDate;
  }

  String formatTime(String inputDateTimeString) {
    DateTime datetime = DateTime.parse(inputDateTimeString);
    String formattedTime = DateFormat('hh:mm a').format(datetime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    String currentTime = formatTime(date.toString());
    String currentDate = formatDate(date.toString());

    // String previousDate = formatDate(previous);

    if (previous) {
      return Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.01,
              child: VerticalDivider(color: Colors.grey[400])),
          CardContainer(
            c: ThemeColors.darkGreen,
            time: currentTime,
            amount: amount,
            name: name,
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.01,
              child: VerticalDivider(color: Colors.grey[400])),
        ],
      );
    } else {
      {
        return Column(
          children: [
            Text(
              currentDate,
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0XFF969696)),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.01,
                child: VerticalDivider(color: Colors.grey[400])),
            CardContainer(
              c: ThemeColors.darkGreen,
              time: currentTime,
              amount: amount,
              name: name,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.01,
                child: VerticalDivider(color: Colors.grey[400])),
          ],
        );
      }
    }
  }
}
