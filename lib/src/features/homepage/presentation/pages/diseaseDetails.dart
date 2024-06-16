import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../data/models/disease.dart';

class DatumDetailsScreen extends StatelessWidget {
  final Datum datum;

  const DatumDetailsScreen({super.key, required this.datum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disease Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                datum.corndiseasepicture1,
                datum.corndiseasepicture2,
                datum.corndiseasepicture3,
              ].map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Text(
              datum.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('Symptoms'),
            _buildParagraph(datum.symptoms),
            const SizedBox(height: 16),
            _buildSectionTitle('Appropriate Treatment'),
            _buildParagraph(datum.appropriatetreatment),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildParagraph(String content) {
    return Text(
      content,
      style: const TextStyle(fontSize: 16),
    );
  }
}
