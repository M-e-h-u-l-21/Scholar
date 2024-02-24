import "package:flutter/material.dart";

class CostRow extends StatelessWidget {
  const CostRow({super.key, required this.text1, required this.text2});
  final String text1;
  final int text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style:
              TextStyle(color: Colors.grey[500], fontStyle: FontStyle.italic),
        ),
        Text(
          "₹${text2.toString()}",
          style:
              TextStyle(color: Colors.grey[500], fontStyle: FontStyle.italic),
        )
      ],
    );
  }
}
