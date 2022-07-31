/*import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:healthify/userInfoScreen/goal.dart';
import 'package:healthify/model/user_model.dart';

class TargetWeight extends StatefulWidget {
  @override
  _TargetWeightState createState() => _TargetWeightState();
}

class _TargetWeightState extends State<TargetWeight> {
  Float bmi;
  String range;
  TextEditingController targetWeightTextController = TextEditingController();
  UserModel _userModel = UserModel();

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
                "What's your Target weight?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(
                height: 14,
              ),
              Text(
                "Your current BMI is $bmi which is $range range.",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  letterSpacing: 1.2,
                ),
              ),

              SizedBox(height: 30),

              Expanded(
                child: TextField(
                  controller: targetWeightTextController,
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
                      hintText: 'Enter your target weight',
                      hintStyle: TextStyle(fontSize: 18)),
                ),
              ),

              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .5,
                  child: GestureDetector(
                    onTap: () {
                      print(targetWeightTextController);
                      _userModel.targetWeight =
                          double.parse(targetWeightTextController.text);
                      print(targetWeightTextController);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TargetGoal();
                          },
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
*/
