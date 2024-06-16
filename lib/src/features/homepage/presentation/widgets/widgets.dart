library widgets;

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
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
  Widget build(BuildContext context) => widget.list.isEmpty
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
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            child: Image.network(
                              e.corndiseasepicture1,
                              fit: BoxFit.cover,
                            )),

                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
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
                    )),
              )
              .toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(height: widget.height*0.2,
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.5,
            aspectRatio: 2.50,
            initialPage: 2,
          ),
        );
}
