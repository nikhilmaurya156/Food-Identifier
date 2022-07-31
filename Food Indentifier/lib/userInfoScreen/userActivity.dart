import 'package:flutter/material.dart';
import 'goal.dart';

class UserActivity extends StatefulWidget {
  UserActivity(
      {Key key,
      @required this.username,
      @required this.gender,
      @required this.age,
      @required this.height,
      @required this.weight})
      : super(key: key);
  final String username;
  final String gender;
  final int age;
  final int height;
  final int weight;
  @override
  _UserActivityState createState() => _UserActivityState(
      username: this.username,
      gender: this.gender,
      age: this.age,
      height: this.height,
      weight: this.weight);
}

class _UserActivityState extends State<UserActivity> {
  _UserActivityState(
      {this.username, this.gender, this.age, this.height, this.weight});
  String username;
  String gender;
  int age;
  int height;
  int weight;
  String _activity = '';

  void active(value) {
    setState(() {
      if (value == 'Liitle or no_activity') {
        _activity = value;
      } else if (value == 'lightly_active') {
        _activity = value;
      } else if (value == 'moderately_active') {
        _activity = value;
      } else {
        _activity = value;
      }
      print(_activity);
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
                "How active are you?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(
                height: 14,
              ),
              Text(
                "Based on your lifestyle we can assess your daily calorie requirements.",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  letterSpacing: 1.2,
                ),
              ),

              SizedBox(height: 30),

              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: 'no_activity',
                      groupValue: _activity,
                      onChanged: (value) {
                        active(value);
                      },
                      activeColor: Colors.indigo,
                    ),
                    Text(
                      "Little or No Activity",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: 'lightly_active',
                      groupValue: _activity,
                      onChanged: (value) {
                        active(value);
                      },
                      activeColor: Colors.green,
                    ),
                    Text(
                      "Lightly Active",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: 'moderately_active',
                      groupValue: _activity,
                      onChanged: (value) {
                        active(value);
                      },
                      activeColor: Colors.red,
                    ),
                    Text(
                      "Moderately Active",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: 'very_active',
                      groupValue: _activity,
                      onChanged: (value) {
                        active(value);
                      },
                      activeColor: Colors.purple,
                    ),
                    Text(
                      "Very Active",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TargetGoal(
                            username: this.username,
                            gender: this.gender,
                            age: this.age,
                            height: this.height,
                            weight: this.weight,
                            useractivity: _activity,
                          ),
                        ),
                      );
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
                        )
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
}
