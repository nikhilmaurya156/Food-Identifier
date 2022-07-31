import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'loginSuccess.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: drawAppBar(),
      body: MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: usernameController,
                style: textStyle(),
                decoration: inputFieldDecoration("username"),
              ),
              TextField(
                obscureText: true,
                controller: passController,
                style: textStyle(),
                decoration: inputFieldDecoration('password'),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    "Forget Password?",
                    style: textStyle(),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  _sendData(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginSuccess();
                  }));
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
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 27,
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
                  "Sign In With Google",
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
                    "Dont Have an Account? ",
                    style: mediumTextStyle(),
                  ),
                  Text(
                    "Register",
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
    );
  }

  void _sendData(BuildContext context) async {
    String textsendmail = usernameController.text;
    String textsendpassword = passController.text;
    String url = 'http://192.168.146.1:8000/login/';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json1 =
        '{"username":"$textsendmail", "password":"$textsendpassword"}';
    http.Response response =
        await http.post(url, headers: headers, body: json1);
    String asd = json.decode(response.body);
  }
}
