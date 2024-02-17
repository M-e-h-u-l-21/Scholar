import "package:flutter/material.dart";

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              color: Colors.grey,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Name",
                ),
                SizedBox(
                  height: 8,
                ),
                Text("Payment was Received"),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.14,
            ),
            Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text("1 min ago")
              ],
            )
          ],
        ),
      ),
    );
  }
}