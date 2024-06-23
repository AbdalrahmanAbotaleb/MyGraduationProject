import 'package:flutter/material.dart';
import 'package:mylast2gproject/src/features/homepage/data/models/plant.dart';

import '../widgets/appbarhome.dart';

class PlantDetailPage extends StatelessWidget {
  final Plant plant;

  PlantDetailPage({required this.plant});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: homeappbar(
              plant.name,
                  () => Navigator.of(context).pop(),
              height,
              width,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlantImage(pictureUrl: plant.pictureUrl),
            PlantDetails(plant: plant),
          ],
        ),
      ),
    );
  }
}

class PlantImage extends StatelessWidget {
  final String pictureUrl;

  PlantImage({required this.pictureUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(pictureUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Add any additional widgets if needed
      ],
    );
  }
}

class PlantDetails extends StatelessWidget {
  final Plant plant;

  PlantDetails({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 223, 255, 252),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 30,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: Offset(-4, -4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Details Of ${plant.name} Plant')
            ,
            const SizedBox(height: 20.0),
            Row(

              children: [
                Expanded(
                  child: PlantDetailItem(
                    title: 'Plant Season',
                    content: plant.plantSeason,
                    icon: Icons.wb_twilight,
                  ),
                ),
                SizedBox(width: 16), // Add spacing between the two items
                Expanded(
                  child: PlantDetailItem(
                    title: 'Plant Category',
                    content: plant.plantCategory,
                    icon: Icons.category,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            PlantDetailItem(
              title: 'Description',
              content: plant.description,
            ),
            PlantDetailItem(
              title: 'Diseases',
              content: plant.diseases,
            ),
            PlantDetailItem(
              title: 'Treatment',
              content: plant.treatment,
            ),
            PlantDetailItem(
              title: 'General Use',
              content: plant.generalUse,
            ),
            PlantDetailItem(
              title: 'Medical Use',
              content: plant.medicalUse,
            ),
            PlantDetailItem(
              title: 'Properties',
              content: plant.properties,
            ),
            PlantDetailItem(
              title: 'Warnings',
              content: plant.warnings,
            ),
            PlantDetailItem(
              title: 'Properties',
              content: plant.properties,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF3E8005),
        fontSize: 22,
        fontFamily: 'Rammetto One',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class PlantDetailItem extends StatelessWidget {
  final String title;
  final String content;
  final IconData? icon; // Add an optional icon parameter

  PlantDetailItem({required this.title, required this.content, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null)
          Icon(
            icon,
            color: Color(0xFF3F8105),
            size: 24,
          ),
        const SizedBox(width: 8), // Adjust spacing between icon and text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF3F8105),
                  fontSize: 16,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Color(0xB257793A),
                    fontSize: 16,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ],
    );
  }
}
