import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerCarousel extends StatelessWidget {
  BannerCarousel({super.key});

  final List<String> banners = ['gambar1.png', 'gambar1.png', 'gambar1.png'];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 160, viewportFraction: 1),
      items: banners.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset('assets/images/$image', fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }
}
