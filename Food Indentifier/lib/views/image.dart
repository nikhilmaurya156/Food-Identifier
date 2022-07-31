// import 'dart:html';
import 'package:f00d/views/caloriedisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:f00d/views/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

var quantityVal;
var foodVessel;

class FoodDescription extends StatefulWidget {
  FoodDescription({Key key, @required this.fname, this.mealType})
      : super(key: key);
  final String fname;
  final String mealType;
  @override
  _FoodDescriptionState createState() =>
      _FoodDescriptionState(fname: this.fname, mealType: this.mealType);
}

class _FoodDescriptionState extends State<FoodDescription> {
  String fname;
  String mealType;
  double cal;
  String link;
  _FoodDescriptionState({this.fname, this.mealType});
  @override
  void initState() {
    super.initState();
    calorie();
  }

  calorie() async {
    String type = mealType;
    print(type);
    print('hii');
    String name = fname;
    print(name);
    String url1 = 'http://10.0.2.2:8000/home/calorie/';
    Map<String, String> headers1 = {"Content-type": "application/json"};
    String json2 = '{"user":"nikhil","fname":"$name","type_meal":"$type"}';
    http.Response response1 =
        await http.post(url1, headers: headers1, body: json2);
    var qwe = json.decode(response1.body);
    print(qwe);
    cal = qwe['calorie'];
    print(cal);
    link = qwe['img_link'];
    print(link);
  }

  Timer _timer = new Timer(const Duration(microseconds: 5000), () {});
  List quantityList = [0.5, 1, 1.5, 2, 2.5, 3];
  // File foodImage;
  List vessel = ['cup', 'pieces', 'plate'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.blue),
              height: MediaQuery.of(context).size.height * .36,
              child: Stack(
                children: [
                  Image.network(
                      'https://nix-tag-images.s3.amazonaws.com/2564_thumb.jpg'),
                  Container(
                    padding: EdgeInsets.all(25),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      fname,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                height: MediaQuery.of(context).size.height * .7,
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Pick the quantity",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .20),
                        Text(
                          "Quantity Help",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .32,
                            // color: Colors.cyan,
                            child: ListView.builder(
                              padding: EdgeInsets.all(8),
                              itemExtent: 50,
                              itemCount: quantityList.length,
                              itemBuilder: (context, index) {
                                return QuantityTile(
                                  quantity: quantityList[index],
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .20),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .32,
                            // color: Colors.cyan,
                            child: ListView.builder(
                              padding: EdgeInsets.all(8),
                              itemExtent: 50,
                              itemCount: vessel.length,
                              itemBuilder: (context, index) {
                                return VesselTile(
                                  vessel: vessel[index],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .15,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          print(cal);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CalorieDisplay(
                              fname: this.fname,
                              mealType: this.mealType,
                              calorie: cal,
                            );
                          }));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width * .5,
                          decoration: BoxDecoration(
                              color: Colors.purple[400],
                              borderRadius: BorderRadius.circular(
                                25,
                              )),
                          child: Text(
                            "ADD",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // decoration: BoxDecoration(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QuantityTile extends StatelessWidget {
  var quantity;

  QuantityTile({this.quantity});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        selectedTileColor: Colors.purple,
        title: Text(
          '$quantity',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        onTap: () {
          quantityVal = quantity;
          print(quantityVal);
        },
      ),
    );
  }
}

class VesselTile extends StatelessWidget {
  var vessel;

  VesselTile({this.vessel});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        selectedTileColor: Colors.purple,
        title: Text(
          '$vessel',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        onTap: () {
          foodVessel = vessel;
          print(foodVessel);
        },
      ),
    );
  }
}
