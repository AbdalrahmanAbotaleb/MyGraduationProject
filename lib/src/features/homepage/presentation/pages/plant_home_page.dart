import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylast2gproject/src/features/homepage/data/models/disease.dart' as disease;
import 'package:mylast2gproject/src/features/homepage/presentation/widgets/widgets.dart';
import '../../../../core/services/NetworkData.dart';
import '../../data/models/category.dart';
import '../controllers/plant_controller.dart';
import 'plant_grid_view.dart';
import 'package:http/http.dart' as http;

class PlantHomePage extends StatefulWidget {
  @override
  State<PlantHomePage> createState() => _PlantHomePageState();
}

class _PlantHomePageState extends State<PlantHomePage> {
  final PlantController plantController =
      Get.put(PlantController(NetworkInfoImpl(Connectivity())));

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  bool isSearchFieldEnabled = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      diseasesList = await getDiseasesList();

      categories = await getCategory();
      if (categories.isNotEmpty) {
        plantController.updateCategory(categories.first);
      }
      setState(() {});
    });
    super.initState();
  }

  Future<List<String>> getCategory() async {
    final url = Uri.parse('https://plantdiseasexapi.runasp.net/api/Plants/categories');

    final res = await http.get(url);
    final status = res.statusCode;
    if (status != 200) {
      return [];
    } else {
      print(jsonDecode(res.body));
      return Categories.fromJson((res.body)).data.map((e) => e.name).toList();
    }
  }

  Future<List<disease.Datum>> getDiseasesList() async {
    final url = Uri.parse('https://plantdiseasexapi.runasp.net/api/cornDisease');

    final res = await http.get(url);
    final status = res.statusCode;
    if (status != 200) {
      return [];
    } else {
      print(jsonDecode(res.body));
      return disease.Disease.fromJson((res.body)).data;
    }
  }

  List<String> categories = [];
  List<disease.Datum> diseasesList = [];

  void onSearchSubmitted(String query) {
    plantController.updateSearchQuery(query);
    setState(() {
      isSearchFieldEnabled = false;
    });
    searchFocusNode.unfocus();
    // Add this line to re-enable the search field for new search queries
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isSearchFieldEnabled = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/images/46-notification.gif'),
              size: 40,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/images/63-settings.gif'),
              size: 40,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        title: Image.asset(
          "assets/images/glogo.png",
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Help Us To Save Our Mother Earth",
                    style: TextStyle(
                      color: Color(0xff394929),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: searchController,
                focusNode: searchFocusNode,
                enabled: isSearchFieldEnabled,
                decoration: InputDecoration(
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                onSubmitted: onSearchSubmitted,
              ),
            ),
            Carousel(
              list: diseasesList,
              height: height,
            ),
            Expanded(
              child: Obx(() {
                if (!plantController.isConnected.value) {
                  return const Center(
                    child: Text('No Internet Connection'),
                  );
                }

                if (plantController.plants.isEmpty || categories.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return DefaultTabController(
                    length: categories.length,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xffE6FFD6),
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          height: height * 0.07,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: TabBar(
                              onTap: (index) {
                                plantController.updateCategory(categories[index]);
                                setState(() {});
                              },
                              isScrollable: true, // Make TabBar scrollable
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: const Color(0xffF2F6EE),
                              ),
                              labelColor: const Color.fromARGB(255, 10, 10, 10),
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                for (int i = 0; i < categories.length; i++)
                                  CustomTab(
                                    text: categories[i],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              plantController.fetchPlants();
                            },
                            child: TabBarView(
                              children: [
                                for (int i = 0; i < categories.length; i++)
                                  PlantGridView(
                                    plants: plantController.categoryNamePlants
                                        .where((plant) => plant.name
                                            .toLowerCase()
                                            .contains(plantController
                                                .searchQuery.value
                                                .toLowerCase()))
                                        .toList(),
                                    height: height,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;

  CustomTab({required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
