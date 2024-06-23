import 'package:flutter/material.dart';

import '../../../ScanningHome/presentation/widgets/ScanAppBar.dart';
import '../../../homepage/presentation/widgets/appbarhome.dart';
import 'switchtheme.dart/themecontroller.dart'; // تعديل مسار الاستيراد حسب هيكل المشروع الفعلي

class AboutAppPage extends StatelessWidget {
  final ThemeController themeController = ThemeController(); // تهيئة متحكم السمة

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          backgroundColor: themeController.isDarkMode.value
              ? Color.fromARGB(255, 15, 238, 171)
              : const Color.fromARGB(255, 241, 241, 241), // تعديل لون شريط التطبيق بناءً على السمة

          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: homeappbar(
              'About App',
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Plants Disease X!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: themeController.isDarkMode.value
                    ? Colors.white
                    : Color(0xFF579133),
                height: 1.5, // زيادة المسافة بين الأسطر
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'The perfect app to help you identify plant diseases and treat them effectively. With advanced technologies and an intuitive user interface, our app aims to make it easier to keep your plants healthy and more productive.',
              style: TextStyle(
                fontSize: 18,
                color: themeController.isDarkMode.value
                    ? Colors.white
                    : Color(0xFF579133),
                height: 1.5, // زيادة المسافة بين الأسطر
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Whether you\'re a professional grower or a hobbyist with houseplants, Plants Disease X gives you the tools and information you need to achieve the best results.',
              style: TextStyle(
                fontSize: 18,
                color: themeController.isDarkMode.value
                    ? Colors.white
                    : Color(0xFF579133),
                height: 1.5, // زيادة المسافة بين الأسطر
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Our app is specifically designed to support growers and hobbyists in keeping their plants healthy and achieving the best productivity. We offer you an integrated platform that includes:',
              style: TextStyle(
                fontSize: 18,
                color: themeController.isDarkMode.value
                    ? Colors.white
                    :  Color(0xFF579133),
                height: 1.5, // زيادة المسافة بين الأسطر
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              '- Accurate diagnosis of plant diseases',
              style: TextStyle(
                fontSize: 18,
                color: themeController.isDarkMode.value
                    ? Colors.white
                    : Color(0xFF579133),
                height: 1.5, // زيادة المسافة بين الأسطر
              ),
            ),
            Text(
              '- Treatment solutions based on modern research',
              style: TextStyle(
                fontSize: 18,
                color: themeController.isDarkMode.value
                    ? Colors.white
                    : Color(0xFF579133),
                height: 1.5, // زيادة المسافة بين الأسطر
              ),
            ),
            Text(
              '- Agricultural advice and guidance',
              style: TextStyle(
                fontSize: 18,
                color: themeController.isDarkMode.value
                    ? Colors.white
                    :  Color(0xFF579133),
                height: 1.5, // زيادة المسافة بين الأسطر
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'We are here to help you achieve your agricultural goals efficiently and effectively.',
              style: TextStyle(
                fontSize: 18,
                color: themeController.isDarkMode.value
                    ? Colors.white
                    :  Color(0xFF579133),
                height: 1.5, // زيادة المسافة بين الأسطر
              ),
            ),
          ],
        ),
      ),
    );
  }
}
