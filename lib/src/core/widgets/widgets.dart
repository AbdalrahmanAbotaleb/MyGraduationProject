library widgets;

import 'package:flutter/material.dart';

import '../../features/ScanningHome/presentation/controllers/scan_controller.dart';

class ScanFrame extends StatelessWidget {
  final double width;
  final double height;
  ScanController controller;
  ScanFrame.ScanFrame(
      {super.key,
      required this.width,
      required this.height,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.4,
      width: width * 0.9,
      child: FittedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(controller.image!)),
            Column(
              children: [
                SizedBox(
                  width: 336,
                  height: 312,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 77.75,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 155.50,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 233.25,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 84,
                        top: 0,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 84,
                        top: 77.75,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 84,
                        top: 155.50,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 84,
                        top: 233.25,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 168,
                        top: 0,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 168,
                        top: 77.75,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 168,
                        top: 155.50,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 168,
                        top: 233.25,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 252,
                        top: 0,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 252,
                        top: 77.75,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 252,
                        top: 155.50,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 252,
                        top: 233.25,
                        child: Container(
                          width: 84,
                          height: 78.25,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFF9E9E9E)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 155.50,
                        child: Container(
                          width: 336,
                          height: 156.50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [Color(0xFF87D05A), Color(0x192C5314)],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 336,
                          height: 311,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFF9E9E9E),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 336,
                          height: 312,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 4,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
