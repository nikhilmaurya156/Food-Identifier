import 'package:flutter/material.dart';
import 'package:f00d/cards/default_food.dart';
import './selectingImage.dart';
import './image.dart';
import 'package:f00d/cards/mealType.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var mealty = MealTypeCard();

class FoodListPage extends StatefulWidget {
  @override
  FoodListPage({Key key, @required this.mealType}) : super(key: key);
  final String mealType;
  _FoodListPageState createState() =>
      _FoodListPageState(mealType: this.mealType);
}

class _FoodListPageState extends State<FoodListPage> {
  _FoodListPageState({this.mealType});
  String mealType;

  _serach(String pattern) async {
    String fname = pattern;
    String m = mealty.mealType;
    String url = 'http://10.0.2.2:8000/home/search/$fname/';
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await http.post(url, headers: headers);
    List asd = json.decode(response.body);

    return asd;
    /*String fname = pattern;
    Map<String, String> headers = {
      'x-app-id': '48af25e5',
      'x-app-key': '6c04092752eb6047764ee3ae740494e6'
    };
    String url = "https://trackapi.nutritionix.com/v2/search/";
    String json1 = '{"query": $fname}';
    http.Response response =
        await http.post(url, headers: headers, body: json1);
    print(response);*/
  }

  _savingFood(String context) async {
    String foodname = context;
    String url = 'http://10.0.2.2:8000/home/food/';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json1 = '{"user":"nikhil","f_name":"$foodname"}';
    http.Response response =
        await http.post(url, headers: headers, body: json1);
    var asd = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .16,
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 29,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .6,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        // color: Colors.grey[200]s,
                      ),
                      child: TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          autofocus: true,
                        ),
                        suggestionsCallback: (pattern) async {
                          return await _serach(pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          print(mealType);
                          _savingFood(suggestion);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FoodDescription(
                                    fname: suggestion,
                                    mealType: this.mealType,
                                  )));
                        },
                      ),
                      /*child: TextField(
                        // autofocus: true,
                        controller: null,
                        cursorColor: Colors.pink[300],
                        decoration: InputDecoration(
                          hintText: "Search for food",
                          hintStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[600],
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),*/
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.camera_enhance_rounded,
                      color: Colors.pink[300],
                      size: 29,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectImage()));
                    },
                  ),
                ],
              ),
            ),
            Container(),
            Container(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/phone_food.jpg',
                      height: MediaQuery.of(context).size.height * .13,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black12,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Track your food with just a SNAP!\nTap here to find out how",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.grey[300],
                ),
                height: MediaQuery.of(context).size.height * .66,
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Frequently Tracked Foods",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 17,
                              // height: 1,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: ,
                        // ),
                        FoodCalCard(
                          foodName: 'Idli',
                          calAmount: 48,
                          foodAmount: 2.0,
                        ),
                        FoodCalCard(
                          foodName: 'Dosa',
                          calAmount: 302,
                          foodAmount: 2.0,
                        ),
                        FoodCalCard(
                          foodName: 'Wheat Chapati',
                          calAmount: 146,
                          foodAmount: 2.0,
                        ),
                        FoodCalCard(
                          foodName: 'Boiled Egg',
                          calAmount: 86,
                          foodAmount: 2.0,
                        ),
                        FoodCalCard(
                          foodName: 'Brown Bread',
                          calAmount: 136,
                          foodAmount: 2.0,
                        ),
                        FoodCalCard(
                          foodName: 'Aloo ka Parantha',
                          calAmount: 182,
                          foodAmount: 2.0,
                        ),
                        FoodCalCard(
                          foodName: 'Banana ripe',
                          calAmount: 117,
                          foodAmount: 2.0,
                        ),
                        FoodCalCard(
                          foodName: 'Tea with Milk and Sugar',
                          calAmount: 73,
                          foodAmount: 2.0,
                        ),
                        FoodCalCard(
                          foodName: "Cow's Milk",
                          calAmount: 167,
                          foodAmount: 2.0,
                        ),
                        FoodCalCard(
                          foodName: 'Filter Coffee with Milk',
                          calAmount: 53,
                          foodAmount: 2.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
