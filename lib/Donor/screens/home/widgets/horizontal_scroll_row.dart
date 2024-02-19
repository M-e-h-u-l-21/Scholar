import "package:flutter/material.dart";
import 'package:gscapp/Donor/screens/home/widgets/horizontal_scroll_item.dart';

class HorizontalScrollTab extends StatelessWidget {
  const HorizontalScrollTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        children: const [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HorizontalScrollItem(
                          title: "School",
                          imageUrl: 'assets/images/graduation.png'),
                      HorizontalScrollItem(
                          title: "Location",
                          imageUrl: 'assets/images/graduation.png'),
                      HorizontalScrollItem(
                          title: "Grades",
                          imageUrl: 'assets/images/graduation.png'),
                      HorizontalScrollItem(
                          title: "Profile",
                          imageUrl: 'assets/images/graduation.png'),
                    ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
