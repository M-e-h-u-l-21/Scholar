import "package:flutter/material.dart";

class StudentPov extends StatelessWidget {
  const StudentPov({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: width * 0.7,
              child: Text(
                "Listen to Rahul's Eagerness to study and fulfill his dreams",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Image(
              image: AssetImage('assets/images/graduation.png'),
              height: height * 0.06,
              width: width * 0.2,
            )
          ],
        ),
      ),
    );
  }
}

