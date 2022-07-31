import 'package:f00d/views/homepage.dart';
import 'package:flutter/material.dart';
//import 'package:f00d/views/homepage.dart';
import 'package:f00d/userInfoScreen/userName.dart';
import 'package:f00d/views/image.dart';
import 'package:f00d/views/Sign.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'package:f00d/views/signUp.dart';
//import 'package:f00d/views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _username();
  }

  void _username() async {
    print('hii');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthyfy',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFE9E9E9),
        // scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.purple[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUp(),
    );
  }
}
