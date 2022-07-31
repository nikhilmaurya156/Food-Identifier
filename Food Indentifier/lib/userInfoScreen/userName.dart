import 'package:flutter/material.dart';
import 'package:f00d/userInfoScreen/gender.dart';

class UserName extends StatefulWidget {
  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  TextEditingController userNameTextController = TextEditingController();
  // double height = MediaQuery.of(context).size.height * .5;

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
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hey there!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "We're happy that you've taken the first step towards a healthier you. We need a few details to kickstart your journey",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Text(
                  "What is your name?",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.25,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black54,
                    ),
                  ),
                  child: TextField(
                    controller: userNameTextController,
                    cursorColor: Colors.purple[700],
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      hintText: "Enter your name",
                    ),
                  ),
                ),
                Container(
                  // color: Colors.black,
                  height: MediaQuery.of(context).size.height * .5,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .62),
                  child: GestureDetector(
                    onTap: () {
                      print(userNameTextController);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenderPage(
                              username: this.userNameTextController.toString()),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                              letterSpacing: 1,
                            ),
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
