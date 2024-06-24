// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../ScanningHome/presentation/widgets/ScanAppBar.dart';
import '../../../homepage/presentation/widgets/appbarhome.dart';

class AboutUs extends StatelessWidget {
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
            child: homeappbar(
              'About Us',
              () {
                Navigator.of(context).pop();
              },
              height,
              width,
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var sheight = constraints.maxHeight;
          var swidth = constraints.maxWidth;

          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: swidth,
                    // color: Color(0xff46f6f6),
                    child: Column(
                      children: [
                        UserRow(
                          imageUrl: "assets/images/gaber.jpeg",
                          userName: "Ahmed Mohamed Gaber (Back-End)",
                        ),
                        UserRow(
                          imageUrl: "assets/images/abdo5.jpeg",
                          userName:
                              "Abdalrahman Abotaleb(Mobile App Developer With Flutter )",
                        ),
                        UserRow(
                          imageUrl: "assets/images/Salem.jpeg",
                          userName: "Ahmed Salem (Front-End Developer)",
                        ),
                        UserRow(
                          imageUrl: "assets/images/basel.jpeg",
                          userName: "Basel Adnan (Machine Learning)",
                        ),
                        UserRow(
                          imageUrl: "assets/images/yasmeen.jpeg",
                          userName: "Yasmeen Mohamed(Back-End)",
                        ),
                        UserRow(
                          imageUrl: "assets/images/Eslam.jpeg",
                          userName: "Eslam Mohamed Badawy (Ux ui designer)",
                        ),
                        UserRow(
                          imageUrl: "assets/images/osama.jpeg",
                          userName: "Osama hisham adley ((Machine learning )",
                        ),
                        UserRow(
                          imageUrl: "assets/images/zezo.jpeg",
                          userName: "Zezo (Front-End Developer)",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class UserRow extends StatelessWidget {
  final String imageUrl;
  final String userName;

  UserRow({required this.imageUrl, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
            radius: 50,
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          Text(
            userName,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
