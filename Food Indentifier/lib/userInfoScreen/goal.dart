import 'package:f00d/views/homepage.dart';
import 'package:flutter/material.dart';
import 'userNeeds.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TargetGoal extends StatefulWidget {
  TargetGoal(
      {Key key,
      @required this.username,
      @required this.gender,
      @required this.age,
      @required this.height,
      @required this.weight,
      @required this.useractivity})
      : super(key: key);
  final String username;
  final String gender;
  final int age;
  final int height;
  final int weight;
  final String useractivity;
  @override
  _TargetGoalState createState() => _TargetGoalState(
      username: this.username,
      gender: this.gender,
      age: this.age,
      height: this.height,
      weight: this.weight,
      useractivity: this.useractivity);
}

class _TargetGoalState extends State<TargetGoal> {
  _TargetGoalState(
      {this.username,
      this.gender,
      this.age,
      this.height,
      this.weight,
      this.useractivity});
  String username;
  String gender;
  int age;
  int height;
  int weight;
  String useractivity;
  double goalGroupValue;
  double goals;

  void goal(value) {
    setState(() {
      if (value == 0.5) {
        goalGroupValue = value;
      } else {
        goalGroupValue = value;
      }
      print(goalGroupValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .08,
        ),
        child: Container(
          padding: EdgeInsets.all(23),
          child: Column(
            children: [
              Text(
                "How fast do you want to reach your goal?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(
                height: 14,
              ),
              Text(
                "This is a good place, but you would need to work a bit harder.)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  letterSpacing: 1.2,
                ),
              ),

              SizedBox(height: 30),
              Row(
                children: [
                  Radio(
                    value: 0.5,
                    groupValue: goalGroupValue,
                    onChanged: (value) {
                      goal(value);
                    },
                    activeColor: Colors.indigo,
                  ),
                  Text(
                    "0.5 kg per week",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 1.0,
                    groupValue: goalGroupValue,
                    onChanged: (value) {
                      goal(value);
                    },
                    activeColor: Colors.indigo,
                  ),
                  Text(
                    "1 kg per week",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .5,
                  child: GestureDetector(
                    onTap: () {
                      _userSubmit();
                      Timer _timer =
                          new Timer(const Duration(microseconds: 5000), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.grey[700],
                        ),
                        Text(
                          "BACK",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          "NEXT",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.grey[700],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         color: Colors.green,
              //         width: 20,
              //         height: 10,
              //         child: Text(index.toString()),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  _userSubmit() async {
    String url = 'http://10.0.2.2:8000/api/userdata/';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json1 =
        '{"user":"nikhil","age":"$age","height":"$height","weight":"$weight","sex":"$gender","activityLevel":"$useractivity","loss_wieght":"$goalGroupValue"}';
    http.Response response =
        await http.post(url, headers: headers, body: json1);
    List asd = json.decode(response.body);
  }
}
