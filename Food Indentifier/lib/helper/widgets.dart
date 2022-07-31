import 'package:flutter/material.dart';

Widget drawAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      'Healthify',
      style: TextStyle(
        color: Colors.black,
        fontSize: 23.5,
        fontStyle: FontStyle.normal,
      ),
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
  );
}

InputDecoration inputFieldDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.black87),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black87),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black54),
    ),
    fillColor: Colors.black,
  );
}

TextStyle textStyle() {
  return TextStyle(
    color: Colors.black87,
    fontSize: 16,
  );
}

TextStyle mediumTextStyle() {
  return TextStyle(
    color: Colors.black87,
    fontSize: 17,
  );
}
