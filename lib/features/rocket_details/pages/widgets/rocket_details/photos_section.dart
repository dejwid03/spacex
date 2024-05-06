import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PhotosSection extends StatelessWidget {
  const PhotosSection(this.imageUrls, {super.key});

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
      ),
      items: imageUrls.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: _buildImage(url),
        );
      }).toList(),
    );
  }

  Widget _buildImage(String url) => Image.network(
        url,
        fit: BoxFit.cover,
      );
}
