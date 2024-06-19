import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylast2gproject/src/core/theme/theme_controller.dart';
import 'package:mylast2gproject/src/features/splashscreen/presentation/pages/SplashScreen.dart';

import 'src/features/settingpage/presentation/pages/Notification/notification_services.dart';
import 'src/features/weatherhome/presentation/pages/welcome.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationService notificationService = NotificationService();
  await notificationService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ThemeController
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/main',
      getPages: [
        GetPage(name: '/main', page: () => MainScreen()),
      ],
        title: 'PlantDiseasesX',
        theme: ThemeData(
          useMaterial3: true,
          brightness: themeController.isDarkTheme.value
              ? Brightness.dark
              : Brightness.light,
        ),
        home: SplashScreenPage(),
      );
    });
  }
}
