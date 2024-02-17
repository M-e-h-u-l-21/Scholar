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
      width: double.infinity,
      color: c,
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
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            SizedBox(
              child: Text("Ronit"),
              width: MediaQuery.of(context).size.width * 0.10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.10,
            ),
            SizedBox(
              child: Text("28,000"),
              width: MediaQuery.of(context).size.width * 0.13,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.10,
            ),
            SizedBox(
              child: Text("UPI"),
              width: MediaQuery.of(context).size.width * 0.14,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.06),
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
