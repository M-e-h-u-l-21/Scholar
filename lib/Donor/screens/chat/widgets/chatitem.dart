import "package:flutter/material.dart";
import "package:gscapp/utils/constants/colors.dart";

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/man.png'),
              width: 60,
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Donation was Received",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey[500]),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  "1 min ago",
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
