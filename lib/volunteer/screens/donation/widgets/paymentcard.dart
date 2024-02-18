import "package:flutter/material.dart";

class CardContainer extends StatelessWidget {
  const CardContainer({
    required this.c,
    super.key,
  });

  final Color c;

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
            Container(
              width: 40,
              height: 40,
              color: Colors.black,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            SizedBox(
              child: Text(
                "Ronit Gupta",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              width: MediaQuery.of(context).size.width * 0.22,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            SizedBox(
              child: Text(
                "28,000",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              width: MediaQuery.of(context).size.width * 0.13,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            SizedBox(
              child: Text(
                "UPI",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              width: MediaQuery.of(context).size.width * 0.14,
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
