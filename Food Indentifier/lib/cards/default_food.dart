import 'package:flutter/material.dart';
import 'package:f00d/views/caloriedisplay.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class FoodCalCard extends StatelessWidget {
  final String foodName;
  final double calAmount;
  final double foodAmount;
  final food_type = 'Breakfast';

  const FoodCalCard({
    this.foodName,
    this.foodAmount,
    this.calAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      // alignment: Alignment.topLeft,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  foodName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacer(),
              Text(
                "$calAmount Cal",
                style: TextStyle(fontSize: 15),
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.pink[300],
                  ),
                  onPressed: () async {
                    String url = 'http://10.0.2.2:8000/home/food/';
                    Map<String, String> headers = {
                      "Content-type": "application/json"
                    };
                    String json1 = '{"user":"nikhil","f_name":"$foodName"}';
                    http.Response response =
                        await http.post(url, headers: headers, body: json1);
                    var asd = json.decode(response.body);
                    Timer _timer =
                        new Timer(const Duration(microseconds: 5000), () {});
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CalorieDisplay(
                              fname: foodName,
                              mealType: this.food_type,
                              calorie: this.calAmount,
                            )));
                  },
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            // padding: EdgeInsets.only(top: 4),
            child: Text(
              "$foodAmount pieces",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
