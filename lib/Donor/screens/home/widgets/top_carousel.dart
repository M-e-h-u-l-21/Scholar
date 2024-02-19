import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import 'package:gscapp/Donor/screens/home/widgets/carousel_item.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: CarouselSlider(
          items: const [
            CarouselItem(
              label: "First Banner",
            ),
            CarouselItem(
              label: "Second Banner",
            ),
            CarouselItem(
              label: "Third Banner",
            ),
          ],
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              height: 180)),
    );
  }
}
