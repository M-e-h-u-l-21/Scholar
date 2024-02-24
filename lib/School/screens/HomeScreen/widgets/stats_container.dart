import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:gscapp/provider/school_studentdataprovider.dart";

class StatsContainer extends ConsumerWidget {
  const StatsContainer({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(schoolDataProvider);
    return Container(
      decoration: BoxDecoration(
          color: Color(0X80e9dcc4), borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Overview Text
          Text(
            "Overview",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: height * 0.015,
          ),

          //Column
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Application Submitted",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      data.length.toString(),
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                Container(
                  child: Divider(
                    height: 10,
                    thickness: 1.5,
                    color: Color(0XFFC8C8C8),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Application Under Review",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "390",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                Container(
                  child: Divider(
                    height: 10,
                    thickness: 1.5,
                    color: Color(0XFFC8C8C8),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Applications Verified",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "390",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                Container(
                  child: Divider(
                    height: 10,
                    thickness: 1.5,
                    color: Color(0XFFC8C8C8),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Donors",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "390",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                Container(
                  child: Divider(
                    height: 10,
                    thickness: 1.5,
                    color: Color(0XFFC8C8C8),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
