import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mylast2gproject/src/features/homepage/data/models/disease.dart';
import '../pages/diseaseDetails.dart';

class Carousel extends StatefulWidget {
  final List<Datum> list;
  final double height;

  Carousel({super.key, required this.list, required this.height});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return widget.list.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : CarouselSlider(
            items: widget.list
                .map(
                  (e) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DatumDetailsScreen(datum: e),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8, // Set the container width
                      height: widget.height * 0.2, // Set the container height
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage(e.corndiseasepicture1),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: widget.height * 0.2, // Adjust the height of the carousel as needed
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              aspectRatio: 16 / 9,
              initialPage: 0,
              scrollDirection: Axis.horizontal,
            ),
          );
  }
}
