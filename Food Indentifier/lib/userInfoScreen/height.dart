import 'package:flutter/material.dart';
import 'package:f00d/userInfoScreen/weight.dart';
import 'weight.dart';

class Height extends StatefulWidget {
  Height(
      {Key key,
      @required this.username,
      @required this.gender,
      @required this.age})
      : super(key: key);
  final String username;
  final String gender;
  final int age;
  @override
  _HeightState createState() =>
      _HeightState(username: this.username, gender: this.gender, age: this.age);
}

class _HeightState extends State<Height> {
  TextEditingController heightTextController = TextEditingController();
  _HeightState({this.username, this.gender, this.age});
  String username;
  String gender;
  int age;

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
                "How tall are you? (in Cm)",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(
                height: 14,
              ),
              Text(
                "Your height will help us calculate important body stats to help you reach your goals faster.)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  letterSpacing: 1.2,
                ),
              ),

              SizedBox(height: 30),

              Expanded(
                child: TextField(
                  controller: heightTextController,
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
                      hintText: 'Enter your height',
                      hintStyle: TextStyle(fontSize: 18)),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .5,
                  child: GestureDetector(
                    onTap: () {
                      print(heightTextController);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Weight(
                            username: this.username,
                            gender: this.gender,
                            age: this.age,
                            height: int.parse(this.heightTextController.text),
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
