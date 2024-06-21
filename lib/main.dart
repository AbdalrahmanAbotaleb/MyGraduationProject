import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylast2gproject/src/features/settingpage/presentation/pages/switchtheme.dart/themecontroller.dart';
import 'package:mylast2gproject/src/features/splashscreen/presentation/pages/SplashScreen.dart';
import 'src/features/settingpage/presentation/pages/Notification/notification_services.dart';
import 'src/features/settingpage/presentation/pages/switchtheme.dart/theme.dart';
import 'src/features/weatherhome/presentation/pages/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationService notificationService = NotificationService();
  await notificationService.init();
  final ThemeController themeController = Get.put(ThemeController());

  runApp(MyApp());
}
Future<void> initServices() async {
  await Get.putAsync(() async => ThemeController()); // Initialize ThemeController
  // Add other async initialization code here if needed
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final ThemeController themeController = Get.find();

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/main', page: () => MainScreen()),
        ],
        title: 'PlantDiseasesX',
        theme: LightThemeColors.theme,
        darkTheme: DarkThemeColors.theme,
       themeMode: Get.find<ThemeController>().themeMode,
        home: SplashScreenPage(),
      );
    });
  }
}
