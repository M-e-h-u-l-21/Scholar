import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gscapp/Donor/screens/home/widgets/horizontal_scroll_row.dart';

class HorizontalScroll extends ConsumerWidget {
  const HorizontalScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final studentData = ref.watch(studentProvider);
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
