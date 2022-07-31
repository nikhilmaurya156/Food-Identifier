import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import './caloriedisplay.dart';

class IdentifyFood extends StatefulWidget {
  @override
  IdentifyFood({Key key, @required this.timage}) : super(key: key);
  final File timage;
  _IdentifyFoodState createState() => _IdentifyFoodState();
}

class _IdentifyFoodState extends State<IdentifyFood> {
  String a = '';
  double calorie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(3),
            ),
            Image.file(
              widget.timage,
              height: 200,
              width: 1000,
            ),
            Padding(
              padding: const EdgeInsets.all(3),
            ),
            ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  _imageProcess(widget.timage);
                }),
            GestureDetector(
              onTap: () {
                _savingFood(a);
                _calorieCalculate(a);
                print(calorie);
                Timer _timer = new Timer(const Duration(seconds: 10), () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CalorieDisplay(
                          fname: a, mealType: "Breakfast", calorie: calorie)));
                });
              },
              child: Text(
                a,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  _savingFood(String context) async {
    String foodname = context;
    String url = 'http://10.0.2.2:8000/home/food/';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json1 = '{"user":"nikhil","f_name":"$foodname"}';
    http.Response response =
        await http.post(url, headers: headers, body: json1);
    var asd = json.decode(response.body);

    //Navigator.push(qwe, MaterialPageRoute(builder: (context) => SelectImage()));
  }

  _calorieCalculate(String context) async {
    String foodname = context;
    String url1 = 'http://10.0.2.2:8000/home/calorie/';
    Map<String, String> headers1 = {"Content-type": "application/json"};
    String json2 =
        '{"user":"nikhil","fname":"$foodname","type_meal":"Breakfast"}';
    http.Response response1 =
        await http.post(url1, headers: headers1, body: json2);
    var qwe = json.decode(response1.body);
    print(qwe);
    calorie = qwe['calorie'];
    print(calorie);
  }

  _imageProcess(File context) async {
    String pimage = context.path;
    String url = 'http://10.0.2.2:8000/home/upload/';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('food_img', pimage));
    var res = await request.send();
    String resptr = await res.stream.bytesToString();
    int z = resptr.length;
    print(z);
    setState(() {
      a = resptr.substring(1, (z - 1));
    });
  }
}
