import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:mylast2gproject/src/features/settingpage/presentation/pages/setting_page.dart';
import '../../../../core/services/NetworkData.dart';
import '../../../settingpage/presentation/pages/Notification/notification_controller.dart';
import '../../data/models/category.dart';
import '../controllers/plant_controller.dart';
import 'plant_grid_view.dart';
import 'package:mylast2gproject/src/features/homepage/data/models/disease.dart'
    as disease;
import 'package:mylast2gproject/src/features/homepage/presentation/widgets/carousel.dart';

class PlantHomePage extends StatefulWidget {
  @override
  State<PlantHomePage> createState() => _PlantHomePageState();
}

class _PlantHomePageState extends State<PlantHomePage> {
  final PlantController plantController =
      Get.put(PlantController(NetworkInfoImpl(Connectivity())));
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final PageController pageController = PageController();
  bool isSearchFieldVisible = false;
  bool _isDisposed = false;
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    _isDisposed = true;
    pageController.dispose(); // Dispose the page controller
    super.dispose();
  }

  Future<void> fetchData() async {
    try {
      await getDiseasesList();
      await getCategory();
      if (categories.isNotEmpty) {
        plantController.updateCategory(
            categories.first); // Update initially selected category
        plantController
            .fetchPlants(); // Fetch plants for initially selected category
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> getCategory() async {
    final url =
        Uri.parse('https://plantdiseasexapi.runasp.net/api/Plants/categories');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      setState(() {
        categories =
            Categories.fromJson(res.body).data.map((e) => e.name).toList();
      });
    } else {
      setState(() {
        categories = [];
      });
    }
  }

  Future<void> getDiseasesList() async {
    final url =
        Uri.parse('https://plantdiseasexapi.runasp.net/api/cornDisease');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      setState(() {
        diseasesList = disease.Disease.fromJson(res.body).data;
      });
    } else {
      setState(() {
        diseasesList = [];
      });
    }
  }

  List<String> categories = [];
  List<disease.Datum> diseasesList = [];

  void toggleSearchFieldVisibility() {
    setState(() {
      isSearchFieldVisible = !isSearchFieldVisible;
      if (!isSearchFieldVisible) {
        searchController.clear();
      }
    });
  }

  void onSearchSubmitted(String query) {
    plantController.updateSearchQuery(query);
    setState(() {
      isSearchFieldVisible = false;
    });
    searchFocusNode.unfocus();
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
            onPressed: () {
              notificationController
                  .toggleSwitch(!notificationController.isSwitched.value);
            },
          ),
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/images/63-settings.gif'),
              size: 40,
            ),
            onPressed: () {
              Get.to(() => SettingPageMain());
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: toggleSearchFieldVisibility,
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
              child: GestureDetector(
                onTap: toggleSearchFieldVisibility,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white, // Background color of the container
                  ),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: isSearchFieldVisible ? 60 : 0,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      children: [
                        // Icon(
                        //   Icons.search,
                        //   color: Colors.green, // Icon color
                        // ),
                        // SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            focusNode: searchFocusNode,
                            enabled: isSearchFieldVisible,
                            style: TextStyle(color: Colors.green), // Text color of the input
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search by name 🔍 🔍',
                              hintStyle: TextStyle(color: Colors.green.withOpacity(0.8)), // Hint text color
                            ),
                            onSubmitted: onSearchSubmitted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            Carousel(
              list: diseasesList,
              height: height,
            ),
            Expanded(
              child: Obx(() {
                if (!plantController.isConnected.value) {
                  return Center(
                    child: Text('No Internet Connection'),
                  );
                }

                if (categories.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return DefaultTabController(
                    length: categories.length,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 50, 128, 0),
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 50.0,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          height: height * 0.07,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: TabBar(
                              onTap: (index) {
                                plantController
                                    .updateCategory(categories[index]);
                                pageController.jumpToPage(index);
                              },
                              isScrollable: true,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: const Color(0xffF2F6EE),
                              ),
                              labelColor: const Color.fromARGB(
                                  255, 57, 73, 41),
                              unselectedLabelColor: Colors.white,
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
                          child: 
                          RefreshIndicator(
  onRefresh: () async {
    plantController.fetchPlants(); // Refresh plants data
  },
  child: PageView.builder(
  controller: pageController,
  physics: NeverScrollableScrollPhysics(), // Disable horizontal scrolling
  onPageChanged: (index) {
    plantController.updateCategory(categories[index]);
  },
  itemCount: categories.length,
  itemBuilder: (context, index) {
    final filteredPlants = plantController
        .categoryNamePlants
        .where((plant) =>
            plant.name.toLowerCase().contains(plantController.searchQuery.value.toLowerCase()))
        .toList();
    return PlantGridView(
      plants: filteredPlants,
      height: height,
    );
  },
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