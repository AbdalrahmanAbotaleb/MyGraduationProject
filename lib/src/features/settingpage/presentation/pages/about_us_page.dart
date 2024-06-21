// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../ScanningHome/presentation/widgets/ScanAppBar.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(height *0.1),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Scanappabr(
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
                    color: Color(0xff46f6f6),
                    child: Column(
                      children: [
                        UserRow(
                          imageUrl:
                              "https://img.freepik.com/premium-photo/immersive-3d-cartoon-avatar-captivating-frontprofile-view-10yearold-white-male-with-black-h_983420-10038.jpg?w=740",
                          userName:
                              "Ashwin Sharma  i am abdalrahman jkafhkadhnfksd djshfksdnhfj",
                        ),
                        UserRow(
                          imageUrl:
                              "https://img.freepik.com/premium-photo/cartoon-character-with-glasses-red-shirt-that-says-i-m-boy_771335-49728.jpg?w=740",
                          userName: "Anshul Joshi",
                        ),
                        UserRow(
                          imageUrl:
                              "https://img.freepik.com/free-photo/view-3d-woman_23-2150709984.jpg?t=st=1698601410~exp=1698605010~hmac=03ce97963f84882c8c29df38af9a86fdf5b327d5687f31f7471bad754614bbad&w=740",
                          userName: "Anjali Joshi",
                        ),
                        UserRow(
                          imageUrl:
                              "https://img.freepik.com/premium-photo/cartoonish-3d-animation-boy-glasses-with-blue-hoodie-orange-shirt_899449-25777.jpg?w=740",
                          userName: "Ashish Dubey",
                        ),
                        UserRow(
                          imageUrl:
                              "https://img.freepik.com/premium-photo/cartoon-character-with-blue-vest-vest-that-says-secret-it_771335-48824.jpg?w=740",
                          userName: "Kanhaiya Dubey",
                        ),
                        UserRow(
                          imageUrl:
                              "https://img.freepik.com/premium-photo/cartoonish-3d-animation-boy-glasses-with-blue-hoodie-orange-shirt_899449-25777.jpg?w=740",
                          userName: "Ashish Dubey",
                        ),
                        UserRow(
                          imageUrl:
                              "https://img.freepik.com/premium-photo/cartoon-character-with-blue-vest-vest-that-says-secret-it_771335-48824.jpg?w=740",
                          userName: "Kanhaiya Dubey",
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
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 50,
            backgroundColor: Colors.blue,
          ),
          SizedBox(width: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                userName,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
