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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HorizontalScrollItem(
                        title: "School",
                        imageUrl: 'assets/images/graduation1.png',
                        size: 60,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      VerticalDivider(),
                      SizedBox(
                        width: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: HorizontalScrollItem(
                          title: "Location",
                          imageUrl: 'assets/images/map.png',
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      VerticalDivider(),
                      SizedBox(
                        width: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: HorizontalScrollItem(
                          title: "Budget",
                          imageUrl: 'assets/images/budget.png',
                          size: 50,
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
