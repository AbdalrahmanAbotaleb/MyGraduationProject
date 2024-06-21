import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  late SharedPreferences prefs;

  ThemeMode get themeMode => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue, // Example primary color
    // Customize other properties for light theme
    // Example:
    // scaffoldBackgroundColor: Colors.white,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.blue,
    //   foregroundColor: Colors.white,
    // ),
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue, // Example primary color
    // Customize other properties for dark theme
    // Example:
    // scaffoldBackgroundColor: Colors.black,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.black,
    //   foregroundColor: Colors.white,
    // ),
  );

  ThemeData getTheme() {
    return isDarkMode.value ? darkTheme : lightTheme;
  }

  @override
  void onInit() {
    super.onInit();
    loadThemeFromPrefs();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    saveThemeToPrefs();
    updateTheme(); // Update theme whenever mode changes
  }

  Future<void> loadThemeFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
  }

  Future<void> saveThemeToPrefs() async {
    await prefs.setBool('isDarkMode', isDarkMode.value);
  }

  void updateTheme() {
    Get.changeTheme(getTheme()); // Notify GetX to change theme globally
  }
}
