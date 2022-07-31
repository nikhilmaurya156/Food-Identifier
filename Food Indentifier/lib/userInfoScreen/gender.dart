import 'package:flutter/material.dart';
import 'age.dart';

class GenderPage extends StatefulWidget {
  GenderPage({Key key, @required this.username}) : super(key: key);
  final String username;
  @override
  _GenderPageState createState() => _GenderPageState(username: this.username);
}

class _GenderPageState extends State<GenderPage> {
  String _genderGroupValue = 'male';
  String username;
  _GenderPageState({this.username});

  void gender(val) {
    setState(() {
      if (val == 'female') {
        _genderGroupValue = val;
      } else {
        _genderGroupValue = val;
      }

      print(_genderGroupValue);
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "What's your gender?",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Based on your gender, we can assess your dietary requirements and cater to specific concerns.",
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
                      value: 'male',
                      groupValue: _genderGroupValue,
                      onChanged: (value) {
                        gender(value);
                      },
                      activeColor: Colors.indigo,
                    ),
                    Text(
                      "Male",
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
                      value: 'female',
                      groupValue: _genderGroupValue,
                      onChanged: (value) {
                        gender(value);
                      },
                      activeColor: Colors.pink[700],
                    ),
                    Text(
                      "Female",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Age(
                              username: this.username,
                              gender: _genderGroupValue),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
