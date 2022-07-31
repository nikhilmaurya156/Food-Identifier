import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String text;
  final Function addCalorieModalBottomSheet;
  const DataCard({
    this.text,
    this.addCalorieModalBottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 9,
      ),
      child: Row(
        children: [
          Icon(Icons.east_sharp),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 28,
            ),
            onPressed: () {
              addCalorieModalBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }
}
