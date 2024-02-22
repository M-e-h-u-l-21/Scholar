import "package:flutter/material.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class StudentInfoRow extends StatelessWidget {
  const StudentInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = TDeviceUtils.getScreenWidth(context);
    final double height = TDeviceUtils.getScreenHeight(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0XFFFFECD0), borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Image(
                image: AssetImage('assets/images/graduation.png'),
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                "St Xavier School",
                style: TextStyle(fontSize: 18),
              )
            ]),
          ),
        ),
        Container(
          height: height * 0.04,
          child: VerticalDivider(color: Colors.black, thickness: 1),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0XFFFFECD0), borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Image(
                image: AssetImage('assets/images/graduation.png'),
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                "8th",
                style: TextStyle(fontSize: 18),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
