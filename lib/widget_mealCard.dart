import 'package:flutter/material.dart';
import 'class_day.dart';
import 'class_meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Color cardColor = Colors.white;
    Color textColor = Colors.black;
    Color foodTypColor = Colors.grey;
    Color foodIconColor = Colors.black;

    if (meal.today) {
      cardColor = Colors.blueGrey;
      textColor = Colors.white;
      foodTypColor = Colors.white54;
      foodIconColor = Colors.white;
    }

    double widthInPercent(x) {
      return (screenWidth - 35) * x / 100; // dreisatz
    }

    return Card(
      color: cardColor,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.fastfood,
                  color: foodIconColor,
                ),
                //SizedBox(width: widthInPercent(5) ,child: Icon(Icons.fastfood)),
                //Text(meal.foodTyp), @TODO: show typ of meal
                SizedBox(width: widthInPercent(5)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: widthInPercent(75),
                      child: Text(
                        meal.title,
                        style: TextStyle(color: textColor),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      meal.foodTyp,
                      style: TextStyle(fontSize: 12, color: foodTypColor),
                    ),
                  ],
                ),
                SizedBox(width: widthInPercent(2)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    meal.price.length < 8 ? // fix weird error when price hast just 6 chars
                      meal.price.substring(0, meal.price.length) : meal.price.substring(0, 7),
                      style: TextStyle(color: textColor),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    meal.price.length > 7 // if there are two prices at one day
                        ? (Text(
                            meal.price.substring(7, 14),
                            style: TextStyle(color: textColor),
                          ))
                        : SizedBox(),
                  ],
                ),
              ],
            ),
            SizedBox(height: 3),
            /*Row (
              children: [
                SizedBox(width: widthInPercent(12)),
                Text(meal.foodTyp, style: TextStyle(fontSize: 12, color: Colors.grey),),
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
