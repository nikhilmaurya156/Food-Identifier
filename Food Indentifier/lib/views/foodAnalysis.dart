import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'foodSearch.dart';

class FoodAnalysis extends StatefulWidget {
  @override
  _FoodAnalysisState createState() => _FoodAnalysisState();
}

class _FoodAnalysisState extends State<FoodAnalysis> {
  double foodProgress = .7;
  List mealType = [
    'breakfast',
    'breakfast',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
  ];
  int calAmount;

  List breakfast = [
    'Poha',
    'Idli',
    'paneer',
    'daal',
    'chicken',
    'chicken',
    'chicken',
  ];
  List breakfastCal = [
    203,
    504,
    43,
    242,
    124,
    243,
    4242,
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 9),
        // padding: EdgeInsets.all(13),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // color: Colors.cyan,

              height: height * .3,
              child: Row(
                children: [
                  Row(
                    children: <Widget>[
                      _RadialProgress(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.4,
                        progress: foodProgress,
                      ),
                      SizedBox(
                        width: width * .1,
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _IngredientProgress(
                            ingredient: "Protein",
                            progress: 0.3,
                            progressColor: Colors.green,
                            leftAmount: 72,
                            width: MediaQuery.of(context).size.width * 0.28,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _IngredientProgress(
                            ingredient: "Carbs",
                            progress: 0.2,
                            progressColor: Colors.red,
                            leftAmount: 252,
                            width: MediaQuery.of(context).size.width * 0.28,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _IngredientProgress(
                            ingredient: "Fat",
                            progress: 0.1,
                            progressColor: Colors.yellow,
                            leftAmount: 61,
                            width: MediaQuery.of(context).size.width * 0.28,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(14), // color: Colors.amber,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Your Daily Foods",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    // Container(
                    //   child: ListView.builder(
                    //     itemCount: breakfast.length,
                    //     itemBuilder: (context, index) {
                    //       return Meal(foodName: breakfast[index], mealType: mealType);
                    //     },
                    //     shrinkWrap: true,
                    //   ),
                    // ),

                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: breakfast.length,
                        itemBuilder: (context, index) {
                          return Meal(
                            foodName: breakfast[index],
                            mealType: mealType[index],
                            calAmount: breakfastCal[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Meal extends StatelessWidget {
  final String mealType, foodName;
  final int calAmount;
  const Meal({
    Key key,
    this.mealType,
    this.foodName,
    this.calAmount,
  }) : super(key: key);

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
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            // padding: EdgeInsets.only(top: 4),
            child: Text(
              "$mealType",
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

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;
  final int totalCal;

  const _RadialProgress(
      {Key key, this.height, this.width, this.progress, this.totalCal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(
        progress: progress,
      ),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$totalCal",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF200087),
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF200087),
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

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.purple[600]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {Key key,
      this.ingredient,
      this.leftAmount,
      this.progress,
      this.progressColor,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}
