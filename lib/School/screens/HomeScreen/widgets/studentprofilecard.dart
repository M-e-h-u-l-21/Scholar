import "package:flutter/material.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class StudentProfileCard extends StatelessWidget {
  const StudentProfileCard({
    super.key,
    required this.name,
    required this.verifiedBy,
    required this.verifiedOn,
  });

  final String name;
  final String verifiedBy;
  final String verifiedOn;

  @override
  Widget build(BuildContext context) {
    final height = TDeviceUtils.getScreenHeight(context);
    final width = TDeviceUtils.getScreenWidth(context);

    return Container(
      color: Colors.green[100],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: height * 0.01),
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
                name,
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
                    verifiedBy,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    verifiedOn,
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
