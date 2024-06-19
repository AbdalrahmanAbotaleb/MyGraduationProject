// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../ScanningHome/presentation/widgets/ScanAppBar.dart';
import 'Notification/notification_controller.dart';
import 'contact_us.dart';

class SettingPageMain extends StatelessWidget {
  const SettingPageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.1),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Scanappabr(
                'Setting Page',
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
          child: Column(
            children: [
              PageSitting(),
            ],
          ),
        ),
      ),
    );
  }
}

class PageSitting extends StatefulWidget {
  @override
  _PageSittingState createState() => _PageSittingState();
}

class _PageSittingState extends State<PageSitting> {
  bool isDarkMode = false;
  bool isPushNotificationEnabled = false;
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              width: constraints.maxWidth,
              height: 812,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: constraints.maxWidth * 0.38,
                    top: 595,
                    child: Container(
                      width: 17,
                      height: 17,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: FlutterLogo(),
                    ),
                  ),
                  Positioned(
                    left: constraints.maxWidth * 0.85,
                    top: 595,
                    child: Container(
                      width: 17,
                      height: 17,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: FlutterLogo(),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: -18,
                    child: Container(
                      width: constraints.maxWidth,
                      height: 294,
                      decoration: ShapeDecoration(
                        color: Color(0xFF579133),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 56,
                    child: Container(
                      width: 200,
                      height: 70,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Settings',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.98,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    top: 147,
                    child: Container(
                      width: constraints.maxWidth - 24,
                      height: 665,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x264B4B4B),
                            blurRadius: 16,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'App Settings',
                                style: TextStyle(
                                  color: Color(0xFFADADAD),
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Divider(color: Color(0xFFC9C9C9), thickness: 0.5),
                            ListTile(
                              title: Text(
                                'Languages',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.chevron_right),
                                onPressed: () {
                                  // Add onPressed functionality here
                                },
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Dark mode',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: Switch(
                                value: isDarkMode,
                                onChanged: (bool value) {
                                  setState(() {
                                    isDarkMode = value;
                                  });
                                },
                              ),
                            ),
                            // ListTile(
                            //   title: Text(
                            //     'Push notifications',
                            //     style: TextStyle(
                            //       color: Colors.black,
                            //       fontSize: 18,
                            //       fontFamily: 'Rubik',
                            //       fontWeight: FontWeight.w400,
                            //     ),
                            //   ),
                            //   trailing: Switch(
                            //     value: notificationController.isSwitched.value,
                            //     onChanged: notificationController.toggleSwitch,
                            //   ),
                            // ),
                            ListTile(
                              title: Text(
                                'Contact Us',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.chevron_right),
                                onPressed: () {
                                  Get.to(() => ContactForm());
                                },
                              ),
                            ),
                            Divider(color: Color(0xFFC9C9C9), thickness: 0.5),
                            ListTile(
                              title: Text(
                                'More',
                                style: TextStyle(
                                  color: Color(0xFFADADAD),
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'About us',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.chevron_right),
                                onPressed: () {
                                  // Add onPressed functionality here
                                },
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'About App',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.chevron_right),
                                onPressed: () {
                                  // Add onPressed functionality here
                                },
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Privacy policy',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.chevron_right),
                                onPressed: () {
                                  // Add onPressed functionality here
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
