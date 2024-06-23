import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylast2gproject/src/features/ScanningHome/presentation/pages/home.dart';
import 'plant_datails.dart';
import '../../data/models/plant.dart';

class PlantGridView extends StatelessWidget {
  final List<Plant> plants;
  final double height;

  const PlantGridView({Key? key, required this.plants, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 100),
      child: Container(

        height: height * 0.9,
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 60),
          children: [
            for (Plant plant in plants)
              Card(
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(16.0),

                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                image: NetworkImage(plant.pictureUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                            ),
                          ),
                          Positioned(

                            bottom: 10,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                plant.name,
                                style: const TextStyle(
                                  color:  Color(0xff256200),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
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
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
