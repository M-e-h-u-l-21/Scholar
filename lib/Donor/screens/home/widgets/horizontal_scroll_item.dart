import "package:flutter/material.dart";

class HorizontalScrollItem extends StatelessWidget {
  const HorizontalScrollItem(
      {Key? key, required this.title, required this.imageUrl, required this.size})
      : super(key: key);

  final String title;
  final String imageUrl;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      child: Column(
        children: [
          Image(
            image: AssetImage(imageUrl),
            height: size.toDouble(),
            width: size.toDouble(),
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
