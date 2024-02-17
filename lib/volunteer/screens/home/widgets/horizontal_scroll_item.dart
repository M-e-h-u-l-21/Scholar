import "package:flutter/material.dart";

class HorizontalScrollItem extends StatelessWidget {
  const HorizontalScrollItem({Key? key, required this.title, required this.imageUrl}) : super(key: key);

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      child: Column(
        children: [
          Image(
            image: AssetImage(imageUrl),
            height: 60,
            width: 60,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
