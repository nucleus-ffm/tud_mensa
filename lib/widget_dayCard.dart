import 'package:flutter/material.dart';

import 'class_day.dart';
import 'widget_mealCard.dart';

class DayCard extends StatelessWidget {
  final Day day;
  const DayCard({Key? key, required this.day}) : super(key: key);

  // Text(day.weekday + " " + day.date),

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 5),
          child: Text(day.weekday + " " + day.date, style: TextStyle(fontSize: 20),),
        ),
        Column(
          children:
            day.meals.map((meal) => MealCard(meal: meal)).toList()
        ),
      ],
    );
  }
}
