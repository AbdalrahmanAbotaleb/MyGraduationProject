import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../data/models/disease.dart';
import '../widgets/appbarhome.dart';

class DatumDetailsScreen extends StatelessWidget {
  final Datum datum;

  const DatumDetailsScreen({super.key, required this.datum});

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
              'Diseases Details',
              () {
                Navigator.of(context).pop();
              },
              height,
              width,
            ),
          ),
        ),
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
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 52, 110, 1),
              ),
            ),

            const SizedBox(height: 24),
            _buildSectionTitle('Symptoms'),
            _buildParagraph(datum.symptoms),
            const SizedBox(height: 16),
            _buildSectionTitle('Appropriate Treatment'),
            _buildParagraph(datum.appropriatetreatment),
            const SizedBox(height: 16),
            _buildSectionTitle('AdditionalInfo'),
            _buildParagraph(datum.additionalinfo),
            const SizedBox(height: 16),
            _buildSectionTitle('Diagnostic Tests'),
            _buildParagraph(datum.diagnostictests),
            const SizedBox(height: 16),
            _buildSectionTitle('ControlMethods'),
            _buildParagraph(datum.controlmethods),
            const SizedBox(height: 16),
            _buildSectionTitle('EconomiCompact'),
            _buildParagraph(datum.economicimpact),
            const SizedBox(height: 16),
            _buildSectionTitle('EnvironmentalConditions'),
            _buildParagraph(datum.environmentalconditions),
            const SizedBox(height: 16),
            _buildSectionTitle('GeographicDistribution'),
            _buildParagraph(datum.geographicdistribution),
            const SizedBox(height: 16),
            _buildSectionTitle('RelatedDiseases'),
            _buildParagraph(datum.relateddiseases),
            const SizedBox(height: 16),
            _buildSectionTitle('HostPlants'),
            _buildParagraph(datum.hostplants),
            const SizedBox(height: 16),
            _buildSectionTitle('Management'),
            _buildParagraph(datum.management),
            const SizedBox(height: 16),
            _buildSectionTitle('PathogenType'),
            _buildParagraph(datum.pathogentype),
            const SizedBox(height: 16),
            _buildSectionTitle('Prevention'),
            _buildParagraph(datum.prevention),
            const SizedBox(height: 16),
            _buildSectionTitle('Reasons'),
            _buildParagraph(datum.reasons),
            const SizedBox(height: 16),
            _buildSectionTitle('ResearchReferences'),
            _buildParagraph(datum.researchreferences),
            const SizedBox(height: 16),
            _buildSectionTitle('RiskFactors'),
            _buildParagraph(datum.riskfactors),
            const SizedBox(height: 16),
            _buildSectionTitle('SympToms'),
            _buildParagraph(datum.symptoms),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3F8105),
      ),
    );
  }

  Widget _buildParagraph(String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF3F8105),
        ),
      ),
    );
  }
}
