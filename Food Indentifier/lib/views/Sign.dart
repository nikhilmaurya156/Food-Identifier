import 'package:flutter/material.dart';
import 'widgets.dart';
import 'LoginPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  signMeUp() {
    if (formkey.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: drawAppBar(),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          return "Not good";
                        },
                        controller: usernameController,
                        style: textStyle(),
                        decoration: inputFieldDecoration("username"),
                      ),
                      TextFormField(
                        controller: emailController,
                        style: textStyle(),
                        decoration: inputFieldDecoration("email"),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        style: textStyle(),
                        decoration: inputFieldDecoration('password'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                // Container(
                //   alignment: Alignment.centerRight,
                //   child: Container(
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                //     child: Text(
                //       "Forget Password?",
                //       style: textStyle(),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 8,
                // ),
                GestureDetector(
                  // onTap: () {
                  //   return signMeUp();
                  // },
                  onTap: () {
                    _sendData(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignIn();
                        },
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple[200],
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Text(
                    "Sign Up With Google",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already Have an Account? ",
                      style: mediumTextStyle(),
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendData(BuildContext context) async {
    String textsenduser = usernameController.text;
    String textsendemail = emailController.text;
    String textsendpassword = passwordController.text;
    String url = 'http://10.0.2.2:8000/api/user/';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json1 =
        '{"username":"$textsenduser", "email":"$textsendemail","password":"$textsendpassword"}';
    http.Response response =
        await http.post(url, headers: headers, body: json1);
    String asd = json.decode(response.body);
    print(asd);
  }
}
