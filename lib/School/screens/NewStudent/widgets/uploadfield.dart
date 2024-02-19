import "package:flutter/material.dart";

class Uploadfield extends StatelessWidget {
  const Uploadfield({Key? key, required this.fieldname, required this.width})
      : super(key: key);
  final double width;
  final String fieldname;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fieldname),
              TextButton(onPressed: () {}, child: Text("Upload Now"))
            ],
          )),
    );
  }
}
