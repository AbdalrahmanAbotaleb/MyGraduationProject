import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

import 'package:mylast2gproject/src/features/weatherhome/data/models/weatherModel.dart';

class WeatherHomeController extends GetxController {
  final TextEditingController cityController = TextEditingController();
  RxBool isLoading = false.obs;
  Rx<Weatherdata?> weatherData = Rx<Weatherdata?>(null);
  RxBool isSwitched = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedState();
  }

  void loadSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cityController.text = prefs.getString('city') ?? 'Cairo';
    isSwitched.value = prefs.getBool('switchState') ?? false;
    getData();
  }

  void saveState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('city', cityController.text);
    prefs.setBool('switchState', isSwitched.value);
  }

  Future<void> getData({String? cityName, List<double>? coordinates}) async {
    isLoading.value = true;
    try {
      String url;
      if (cityName != null) {
        url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=509dc5d730ff2dd6003b22f30ae93313';
      } else if (coordinates != null) {
        url = 'https://api.openweathermap.org/data/2.5/weather?lat=${coordinates[0]}&lon=${coordinates[1]}&appid=509dc5d730ff2dd6003b22f30ae93313';
      } else {
        url = 'https://api.openweathermap.org/data/2.5/weather?q=${cityController.text}&appid=509dc5d730ff2dd6003b22f30ae93313';
      }

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData != null) {
          weatherData.value = Weatherdata.fromJson(jsonData);
          isLoading.value = false;
          checkTemperatureAndSendAlert();
        }
      } else {
        // Handle non-200 status code here
      }
    } catch (e) {
      // Handle error here
    }
  }

  void checkTemperatureAndSendAlert() {
    if (weatherData.value != null) {
      double temperature = weatherData.value!.main.temp;
      if (temperature > 35) {
        Get.defaultDialog(
          title: 'تنبيه!',
          content: Text('درجة الحرارة مرتفعة جداً، يرجى اتخاذ الاحتياطات اللازمة.'),
          confirm: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('حسنًا'),
          ),
        );
      } else if (temperature < 8) {
        Get.defaultDialog(
          title: 'تنبيه!',
          content: Text('درجة الحرارة منخفضة جداً، المحاصيل قد تكون معرضة للتلف.'),
          confirm: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('حسنًا'),
          ),
        );
      }
    }
  }

  void toggleSwitch() {
    isSwitched.value = !isSwitched.value;
    saveState();
  }

  Future<void> getWeatherByLocation() async {
    List<double> coordinates = await getLocation();
    await getData(coordinates: coordinates);
    print('${coordinates} -------------------');
  }

 Future<List<double>> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled, show an error to the user
    Get.snackbar(
      'Location Services Disabled',
      'Please enable location services in your device settings.',
      snackPosition: SnackPosition.BOTTOM,
    );
    return [0.0, 0.0]; // Return a default or invalid location
  }

  // Check if permission is granted
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, show an error to the user
      Get.snackbar(
        'Location Permission Denied',
        'Please grant location permission to use this feature.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return [0.0, 0.0]; // Return a default or invalid location
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, show an error to the user
    Get.snackbar(
      'Location Permission Denied Forever',
      'Please grant location permission from device settings.',
      snackPosition: SnackPosition.BOTTOM,
    );
    return [0.0, 0.0]; // Return a default or invalid location
  }

  // Get the current position
  try {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return [position.latitude, position.longitude];
  } catch (e) {
    // Handle the error, e.g., show a message to the user
    Get.snackbar(
      'Location Error',
      'Failed to get the current location. Please try again.',
      snackPosition: SnackPosition.BOTTOM,
    );
    return [0.0, 0.0]; // Return a default or invalid location
  }
}

}