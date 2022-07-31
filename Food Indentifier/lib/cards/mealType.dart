import 'package:flutter/material.dart';
import 'package:f00d/views/foodSearch.dart';

class MealTypeCard extends StatelessWidget {
  final String mealType;
  final int totalCal, consumedCal;
  const MealTypeCard({this.mealType, this.totalCal, this.consumedCal});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 18),
      child: Row(
        children: [
          Text(
            mealType,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),
          Spacer(),
          Text(
            '$consumedCal of $totalCal Cal',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.pink[400],
              size: 28,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FoodListPage(mealType: this.mealType)),
              );
            },
          ),
        ],
      ),
    );
  }
}
