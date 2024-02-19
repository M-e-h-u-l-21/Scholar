import "package:flutter/material.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class StudentProfileCard extends StatelessWidget {
  const StudentProfileCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final height = TDeviceUtils.getScreenHeight(context);
    final width = TDeviceUtils.getScreenWidth(context);

    return Container(
      color: Colors.green[100],
      height: height * 0.215,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(),
                child: Container(
                  color: Colors.black,
                  width: width * 0.25,
                  height: height * 0.09,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "Tony Roy",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Verified by",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Verified on",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pankaj Rajmani",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "26/10/23",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
