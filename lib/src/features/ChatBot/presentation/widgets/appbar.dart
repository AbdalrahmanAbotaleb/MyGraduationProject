import 'package:flutter/material.dart';

import '../../../ScanningHome/presentation/pages/home.dart';

Widget appBar(String text, VoidCallback func, Widget widget, double height,
    double width, ) {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Container(
      width: width,
      height: height * 0.09,padding: EdgeInsets.symmetric(horizontal: width*0.04),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,      mainAxisSize: MainAxisSize.min,
        children: [
          Transform.flip(flipX: true, child: customButton(func)),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          widget
        ],
      ),
    ),
  );
}
