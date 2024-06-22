// ignore_for_file: sort_child_properties_last

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mylast2gproject/src/features/weatherhome/presentation/pages/weatherui.dart';

class MainScreen extends StatelessWidget {
  final Duration duration = const Duration(milliseconds: 800);

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: Container(
        margin: const EdgeInsets.all(8),
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FadeInUp(
              duration: duration,
              delay: const Duration(milliseconds: 2000),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 50,
                  left: 5,
                  right: 5,
                ),
                width: size.width,
                height: size.height / 2,
                child:
                    Lottie.asset("assets/images/weather2.json", animate: true),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FadeInUp(
              duration: duration,
              delay: const Duration(milliseconds: 1600),
              child: const Text(
                "Welcome ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FadeInUp(
              duration: duration,
              delay: const Duration(milliseconds: 1000),
              child: const Text(
                "To knows The Weather ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.2,
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(child: Container()),
            FadeInUp(
              duration: duration,
              delay: const Duration(milliseconds: 600),
              child: SizedBox(
                width: 250,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => WeatherHomePage());
                  },
                  child: Container(
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: Text(
                        "Show Temperature",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.43,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF569033),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 32,
                          offset: Offset(0, 20),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                  ),
                ),
                //  ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Color.fromARGB(255, 34, 240, 95),
                //   ),
                //   onPressed: () {
                //     Get.to(() => WeatherHomePage());
                //   },
                //   child: Text(
                //     'Show Temperature',
                //     style: TextStyle(fontSize: 20),
                //   ),
                // ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
