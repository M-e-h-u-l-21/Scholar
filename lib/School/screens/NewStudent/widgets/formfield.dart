import "package:flutter/material.dart";

class FormItem extends StatelessWidget {
  const FormItem({
    super.key,
    required this.width,
    required this.fieldname,
  });

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
            children: [Text(fieldname), TextFormField()],
          )),
    );
  }
}
