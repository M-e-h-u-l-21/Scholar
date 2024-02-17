import "package:flutter/material.dart";

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.black,
          width: double.infinity,
          height: 120, //Koi farak hi nhi pad rha idhar ,  isko fix krna padega
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
