import "package:flutter/material.dart";

class CardContainer extends StatelessWidget {
  const CardContainer({
    required this.c,
    super.key,
    required this.time,
    required this.name,
    required this.amount,
  });

  final Color c;
  final String time;
  final String name;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: c,
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image(
              width: 40,
              height: 40,
              image: AssetImage('assets/images/upi.png'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            SizedBox(
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              width: MediaQuery.of(context).size.width * 0.20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            SizedBox(
              child: Text(
                amount.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              width: MediaQuery.of(context).size.width * 0.13,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            SizedBox(
              child: Text(
                time,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              width: MediaQuery.of(context).size.width * 0.16,
            ),
            // SizedBox(width: MediaQuery.of(context).size.width * 0.06),
            // Stack(
            //   alignment: Alignment.centerRight,
            //   children: [
            //     Container(
            //       width: 40,
            //       height: 40,
            //       color: Colors.blue,
            //     ),

            //     // Container(
            //     //   width: 40,
            //     //   height: 40,
            //     //   color: Colors.black,
            //     // ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
