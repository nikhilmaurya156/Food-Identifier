import 'package:flutter/material.dart';
//import 'package:f00d/data/calorieData.dart';
import 'package:f00d/cards/calorieCard.dart';
import 'package:f00d/cards/mealType.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int tCal,
      conCal,
      btCal,
      ltCal,
      stCal,
      dtCal,
      consumedGlass,
      calBurnt,
      calNeedtoBurnt,
      bconCal,
      lconCal,
      sconCal,
      dconCal;
  double weightGained, targetedWeight;
  @override
  void initState() {
    super.initState();
    _totalCalorie();
    _typeCalorie();
  }

  _totalCalorie() async {
    String url = 'http://10.0.2.2:8000/api/consumed/totalcalorie/';
    Map<String, String> headers1 = {"Content-type": "application/json"};
    String json2 = '{"user":"nikhil"}';
    http.Response response1 =
        await http.post(url, headers: headers1, body: json2);
    var qwe = json.decode(response1.body);
    print(qwe);
    setState(() {
      tCal = qwe['tc'];
      conCal = qwe['utc'];
    });
  }

  _typeCalorie() async {
    String url = 'http://10.0.2.2:8000/api/consumed/typecalorie/';
    Map<String, String> headers1 = {"Content-type": "application/json"};
    String json2 = '{"user":"nikhil"}';
    http.Response response1 =
        await http.post(url, headers: headers1, body: json2);
    var qwe = json.decode(response1.body);
    print(qwe);
    setState(() {
      btCal = qwe['bc'];
      ltCal = qwe['lc'];
      stCal = qwe['sc'];
      dtCal = qwe['dc'];
      bconCal = qwe['cbc'];
      lconCal = qwe['clc'];
      sconCal = qwe['csc'];
      dconCal = qwe['cdc'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 38.0,
                backgroundColor: Colors.red,
              ),
              Text(
                "Hello World",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                "Today",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23.5,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 30,
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Icon(
              Icons.alarm,
              color: Colors.black,
              size: 31.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Icon(
              Icons.share,
              color: Colors.black,
              size: 31.0,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: new Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 29),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      height: 90.0,
                      color: Colors.purple[400],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lose weight the SMART way!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "1000+ people created a diet fitness plan today",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      DataCard(
                        text: '$conCal of $tCal Cal Eaten',
                        addCalorieModalBottomSheet: addCalorieModalBottomSheet,
                      ),
                      DataCard(
                        text: 'Consumed 8 glass of water',
                        addCalorieModalBottomSheet: addCalorieModalBottomSheet,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {
              _totalCalorie();
              _typeCalorie();
            });
          }),
    );
  }

  void addCalorieModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Which meal would you like to track?",
                    // textAlign: TextAlign.left,
                    // textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.pink[400],
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MealTypeCard(
                  mealType: 'BreakFast',
                  consumedCal:
                      bconCal, //this is the birfurcation of total calories
                  totalCal: btCal, //this is the birfurcation of total calories
                ),
                MealTypeCard(
                  mealType: 'Lunch',
                  consumedCal:
                      lconCal, //this is the birfurcation of total calories
                  totalCal: ltCal, //this is the birfurcation of total calories
                ),
                MealTypeCard(
                  mealType: 'Evening Snack',
                  consumedCal:
                      sconCal, //this is the birfurcation of total calories
                  totalCal: stCal, //this is the birfurcation of total calories
                ),
                MealTypeCard(
                  mealType: 'Dinner',
                  consumedCal:
                      dconCal, //this is the birfurcation of total calories
                  totalCal: dtCal, //this is the birfurcation of total calories
                ),
              ],
            ),
          );
        });
  }
}
