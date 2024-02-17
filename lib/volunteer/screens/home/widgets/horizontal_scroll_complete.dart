import "package:flutter/material.dart";
import 'package:gscapp/volunteer/screens/home/widgets/horizontal_scroll_row.dart';

class HorizontalScroll extends StatelessWidget {
  const HorizontalScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Sort by -",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.72,
          child: HorizontalScrollTab(),
        )
      ],
    );
  }
}