import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylast2gproject/src/features/ScanningHome/presentation/pages/home.dart';
import 'plant_datails.dart';
import '../../data/models/plant.dart';

class PlantGridView extends StatelessWidget {
  final List<Plant> plants;
  final double height;

  const PlantGridView({super.key, required this.plants, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.8,
      child: Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.fromLTRB(8,8,8,60),
          children: [
            for (Plant plant in plants)
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(plant.pictureUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff569033),
                            shape: BoxShape.circle,
                          ),
                          child: customButton(() {
                            Get.to(() => PlantDetailPage(plant: plant));
                          })),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          plant.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],

        ),
      ),
    );
  }
}
