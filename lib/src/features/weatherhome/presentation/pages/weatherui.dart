import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylast2gproject/src/core/constants/weatherConst.dart';
import 'package:mylast2gproject/src/features/weatherhome/presentation/controllers/WeatherController.dart';
import 'package:mylast2gproject/src/features/weatherhome/presentation/widgets/weather_cold.dart';
import 'package:mylast2gproject/src/features/weatherhome/presentation/widgets/weather_hot.dart';

class WeatherHomePage extends StatelessWidget {
  final WeatherHomeController controller = Get.put(WeatherHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: controller.isSwitched.value ? const Color(0xff090a0a) : const Color(0xffeaedf1),
        elevation: 0.0,
        title: Obx(() => Text(
          'Weather App',
          style: controller.isSwitched.value ? blacktheme : lighttheme,
        )),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                color: controller.isSwitched.value ? Colors.white : Colors.black,
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Search By City Name',
                    content: TextField(
                      onChanged: (value) {},
                      controller: controller.cityController,
                      decoration: InputDecoration(hintText: "City name : "),
                    ),
                    textConfirm: 'Search',
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      controller.saveState();
                      controller.getData();
                      Get.back();
                    },
                  );
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.my_location,
                  size: 30,
                ),
                onPressed: () {
                  controller.getWeatherByLocation();
                },
              ),
              Obx(() => Switch(
                value: controller.isSwitched.value,
                onChanged: (value) => controller.toggleSwitch(),
              )),
            ],
          ),
        ],
      ),
      body: Obx(
        () => Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/weather.jpeg', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            // Your content
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: controller.isSwitched.value ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.5),
                child: Column(
                  children: [
                    controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : controller.weatherData.value != null
                            ? Column(
                                children: [
                                  controller.weatherData.value!.main.temp > 292
                                      ? WeatherWidget(
                                          weatherData: controller.weatherData.value,
                                          isSwitched: controller.isSwitched.value,
                                        )
                                      : WeatherWidgetCold(
                                          weatherData: controller.weatherData.value,
                                          isSwitched: controller.isSwitched.value,
                                        )
                                ],
                              )
                            : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
