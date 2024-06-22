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
              fit: BoxFit.cover,
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
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(31, 10, 10, 10),
              blurRadius: 0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Details Of ${plant.name} Plant'),
            const SizedBox(height: 16.0),
            PlantDetailItem(title: 'Description', content: plant.description),
            PlantDetailItem(title: 'Diseases', content: plant.diseases),
            PlantDetailItem(title: 'Treatment', content: plant.treatment),
            PlantDetailItem(title: 'Plant Season', content: plant.plantSeason),
            PlantDetailItem(title: 'General Use', content: plant.generalUse),
            PlantDetailItem(title: 'Medical Use', content: plant.medicalUse),
            PlantDetailItem(title: 'Properties', content: plant.properties),
            PlantDetailItem(title: 'Warnings', content: plant.warnings),
            PlantDetailItem(title: 'Plant Category', content: plant.plantCategory),
            PlantDetailItem(title: 'Properties', content: plant.properties),
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
        fontSize: 17,
        fontFamily: 'Rammetto One',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class PlantDetailItem extends StatelessWidget {
  final String title;
  final String content;

  PlantDetailItem({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
