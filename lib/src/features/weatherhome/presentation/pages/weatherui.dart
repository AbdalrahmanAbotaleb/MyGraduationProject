// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../data/models/weatherModel.dart';
import '../controllers/WeatherController.dart';
import '../widgets/weather_app_bar.dart';
import 'search_page.dart';

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final WeatherController weatherController = Get.put(WeatherController());

  // Reactive flag to track if bottom sheet has been shown
  RxBool bottomSheetShown = false.obs;

  @override
  void initState() {
    super.initState();
    // Initialize the bottomSheetShown state based on weather conditions
    initializeBottomSheetState();
  }

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
            child: WeatherAppBar(
              title: 'Weather Home',
              onSearchPressed: () {
                // Navigate to SearchPage and reset bottom sheet state
                navigateToSearchPage();
              },
              onCustomButtonPressed: () {
                Navigator.of(context).pop();
              },
              height: height,
              width: width,
            ),
          ),
        ),
      ),
      body: Obx(() {
        // Check if weather data is available
        if (weatherController.weatherData.value == null) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'there is no weather 😔 start',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                Text(
                  'searching now 🔍',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                )
              ],
            ),
          );
        } else {
          WeatherModel weatherData = weatherController.weatherData.value!;

          // Check temperature conditions and show bottom sheet
          if (weatherData.temp > 30 && !bottomSheetShown.value) {
            bottomSheetShown.value = true;
            showTemperatureWarningBottomSheet(
                context,
                'Temperature is above 30°C. Avoid pesticide spraying.',
                weatherData, () {
              // Bottom sheet dismissed
              bottomSheetShown.value = false;
            });
          } else if (weatherData.temp < 20 && !bottomSheetShown.value) {
            bottomSheetShown.value = true;
            showTemperatureWarningBottomSheet(
                context,
                'Temperature is below 20°C. Avoid pesticide spraying.',
                weatherData, () {
              // Bottom sheet dismissed
              bottomSheetShown.value = false;
            });
          }

          // Build weather information UI
          return Container(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/weather.jpg"))

                // gradient: LinearGradient(
                //   colors: [
                //     weatherData.getThemeColor(),
                //     weatherData.getThemeColor()[300]!,
                //     weatherData.getThemeColor()[100]!,
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
                ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20), // Added to create space
                    Text(
                      weatherController.cityName.value!,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'updated at : ${weatherData.date.hour.toString().padLeft(2, '0')}:${weatherData.date.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 20), // Added to create space
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BoxedIcon(weatherData.getIcon(), size: 50),
                        Column(
                          children: [
                            Text('maxTemp: ${weatherData.maxTemp.toInt()}°C'),
                            Text('minTemp: ${weatherData.minTemp.toInt()}°C'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Added to create space
                    Text(
                      "  Temperature ${weatherData.temp.toInt().toString()}",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    buildWeatherDetail(
                        'Wind Speed', '${weatherData.windSpeed} kph'),
                    buildWeatherDetail('Humidity', '${weatherData.humidity}%'),
                    buildWeatherDetail(
                        'Precipitation', '${weatherData.precipitation} mm'),
                    const SizedBox(height: 20), // Added to create space
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  void initializeBottomSheetState() {
    // Initialize bottomSheetShown state based on weather conditions
    WeatherModel? weatherData = weatherController.weatherData.value;
    if (weatherData != null) {
      if (weatherData.temp > 30) {
        bottomSheetShown.value = true;
      } else if (weatherData.temp < 20) {
        bottomSheetShown.value = true;
      }
    }
  }

  void navigateToSearchPage() {
    // Navigate to SearchPage
    Get.to(() => SearchPage())?.then((_) {
      // Reset bottomSheetShown state when returning from SearchPage
      bottomSheetShown.value = false;
    });
  }

  void showTemperatureWarningBottomSheet(BuildContext context, String message,
      WeatherModel weatherData, VoidCallback onDismiss) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => DraggableScrollableSheet(
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Warning!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    buildWeatherDetail('Temperature', '${weatherData.temp}°C'),
                    buildWeatherDetail(
                        'Wind Speed', '${weatherData.windSpeed} kph'),
                    buildWeatherDetail('Humidity', '${weatherData.humidity}%'),
                    buildWeatherDetail(
                        'Precipitation', '${weatherData.precipitation} mm'),
                    buildWeatherDetail('Max Temp', '${weatherData.maxTemp}°C'),
                    buildWeatherDetail('Min Temp', '${weatherData.minTemp}°C'),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget buildWeatherDetail(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
