import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderExample extends StatelessWidget {
   CarouselSliderExample({super.key});

  final imgS = [
    "assets/images/my profile pic.jpg",
    "assets/images/IMG_1357.JPG",
    "assets/images/IMG_1377.JPG",
    "assets/images/IMG_1439.JPG",
    "assets/images/IMG_1456.JPG",
    "assets/images/IMG_1466.JPG",
    // "assets/images/IMG_1357.JPG",
    // "assets/images/IMG_1357.JPG",
    // assets/icons/bananas-icon.png
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          items: List.generate(
            6,
            (index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    imgS[index],
                  ),
                ),
              ),
            ),
          ),
          options: CarouselOptions(
              height: 400,
              viewportFraction: .9,
              initialPage: 1,
              aspectRatio: 4 / 3,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayCurve: Curves.easeIn,
              pauseAutoPlayOnTouch: true),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CarouselSliderExample(),
  ));
}
