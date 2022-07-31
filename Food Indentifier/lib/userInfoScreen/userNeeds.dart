/*import 'package:flutter/material.dart';
import 'package:healthify/views/homepage.dart';

class UserNeedToDo extends StatefulWidget {
  @override
  _UserNeedToDoState createState() => _UserNeedToDoState();
}

class _UserNeedToDoState extends State<UserNeedToDo> {
  int dailyCal, dailyCalBurn;
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
              children: [
                Text(
                  "To stay fit, you need to",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Icon(
                      Icons.food_bank,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Eat $dailyCal Cal everyday',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Icon(
                      Icons.waterfall_chart,
                      color: Colors.indigo,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Drink 8 glasses of water everyday',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Icon(
                      Icons.do_not_step_sharp,
                      color: Colors.green,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Walk 10000 steps everyday',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Icon(
                      Icons.run_circle,
                      color: Colors.blue[900],
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Burn $dailyCalBurn Cal everyday',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                    'Tracking your Food, Water, Steps and Workout will help you reach your goal 3X faster.'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width * .7,
                    decoration: BoxDecoration(
                        color: Colors.purple[400],
                        borderRadius: BorderRadius.circular(
                          25,
                        )),
                    child: Text(
                      "LET'S GET STARTED",
                      style: TextStyle(color: Colors.white),
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
*/
