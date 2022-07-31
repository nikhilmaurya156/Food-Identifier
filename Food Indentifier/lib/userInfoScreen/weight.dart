import 'package:flutter/material.dart';
//import 'package:healthif/userInfoScreen/targetweight.dart';
import 'userActivity.dart';

class Weight extends StatefulWidget {
  Weight(
      {Key key,
      @required this.username,
      @required this.gender,
      @required this.age,
      @required this.height})
      : super(key: key);
  final String username;
  final String gender;
  final int age;
  final int height;
  @override
  _WeightState createState() => _WeightState(
      username: this.username,
      gender: this.gender,
      age: this.age,
      height: this.height);
}

class _WeightState extends State<Weight> {
  TextEditingController weightTextController = TextEditingController();
  _WeightState({this.username, this.gender, this.age, this.height});
  String username;
  String gender;
  int age;
  int height;
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
                "What's your current weight?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(
                height: 14,
              ),
              Text(
                "This information will help us determine your goal weight and monitor your progress over time.",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  letterSpacing: 1.2,
                ),
              ),

              SizedBox(height: 30),

              Expanded(
                child: TextField(
                  controller: weightTextController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  // keyboardType: TextInputType.number,
                  cursorColor: Colors.purple[200],
                  decoration: InputDecoration(
                      focusColor: Colors.blue,
                      // labelText: 'age',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                        gapPadding: 10,
                      ),
                      // floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                        gapPadding: 10,
                      ),
                      hintText: 'Enter your weight',
                      hintStyle: TextStyle(fontSize: 18)),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .5,
                  child: GestureDetector(
                    onTap: () {
                      print(weightTextController);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserActivity(
                            username: this.username,
                            gender: this.gender,
                            age: this.age,
                            height: this.height,
                            weight: int.parse(weightTextController.text),
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
