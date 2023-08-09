import 'package:flutter/material.dart';

Widget LongGreenButton(
    {required String txt, required Function() onTap, required double width}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.green),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.09),
                  blurRadius: 8,
                  spreadRadius: 1.2,
                  offset: Offset(4, 10),
                ),
              ]),
          width: width,
          child: Text(
            txt,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        )),
  );
}
