import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TextFild({
  required String hintTxt,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
  required IconData image,
  required double width,
}) {
  return Container(
    height: 65.0,
    padding: EdgeInsets.only(left: 25, right: 25),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 0.2, color: Colors.green)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width,
          child: TextField(
            controller: controller,
            obscureText: isObs,
            keyboardType: keyBordType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 20,
          child: Icon(
            image,
            size: 20,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ],
    ),
  );
}
